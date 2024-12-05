from flask import Flask, render_template, jsonify, request
from datetime import datetime
import requests
from confi_conn import obtener_conexion


app = Flask(__name__)
app.secret_key = '454ghgghfg8h9fghFGHGFHGFHGFHjnrjtr'


@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')


@app.route('/endpoint-api-motivos', methods=['POST'])
def execute_code():
    try:
        if not request.is_json:
            return jsonify({"error": "El cuerpo de la solicitud no es JSON"}), 400

        data = request.get_json()
        new_row = data.get('newRow', {})

        # Validar campos de entrada
        if not new_row:
            return jsonify({"error": "El campo 'newRow' está vacío"}), 400
        if not all(field in new_row for field in ('id', 'motivo', 'estado')):
            return jsonify({"error": "Faltan campos requeridos en 'newRow'"}), 400

        # Validar timestamp
        timestamp = data.get('timestamp', '')
        try:
            timestamp_obj = datetime.fromisoformat(timestamp.replace("Z", "+00:00"))
            formatted_timestamp = timestamp_obj.strftime('%d/%m/%Y %H:%M:%S')
        except ValueError:
            return jsonify({"error": "El formato del timestamp no es válido"}), 400

        # Procesar registro
        registro = {
            "id": new_row['id'],
            "estado": new_row['estado']
        }

        # Buscar motivo en la base de datos
        buscar_motivo = new_row['motivo']
        payload = {
            "id": new_row['id'],
            "estado": new_row['estado']
            }

        with obtener_conexion() as conexion_MySQLdb:
            with conexion_MySQLdb.cursor(dictionary=True) as cursor:
                querySQL = "SELECT rechazomotivo, rechazosubmotivo FROM tbl_respuesta_motivo WHERE motivo LIKE %s"
                cursor.execute(querySQL, (f"%{buscar_motivo}%",))
                data_motivos = cursor.fetchone()

                if not data_motivos:
                    return jsonify({"status": "error", "message": "No se encontraron motivos"}), 404

                payload.update({
                    "rechazomotivo": data_motivos['rechazomotivo'],
                    "rechazosubmotivo": data_motivos['rechazosubmotivo']
                })


                registro.update({
                    "rechazomotivo": data_motivos['rechazomotivo'],
                    "rechazosubmotivo": data_motivos['rechazosubmotivo'],
                    "timestamp": formatted_timestamp
                 })

        # Enviar datos al API
        respuesta_api = enviar_data_api(payload)
        if respuesta_api and respuesta_api.status_code == 200:

            # Guardar datos exitosos en un archivo
            with open('datos_recibidos.txt', 'a', encoding='utf-8') as file:
                file.write(f"{registro}\n")

            print(f"El registro se envio correctamente: {payload}")
        else:
            print(f"Error al enviar datos al API: {respuesta_api.text if respuesta_api else 'Sin respuesta'}")

        return jsonify({
            "message": "Datos procesados correctamente",
            "registro": registro,
            "status": "success"
        }), 200

    except Exception as e:
        print(f"Error en el endpoint: {e}")
        return jsonify({"error": "Ocurrió un error procesando los datos"}), 500


def enviar_data_api(data_api):
    try:
        url_api = "https://integracionesiepp.bucketdata.es/integracionesiepp/IEPP-lead/resultadoLead.htm"
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer tu_token"  # Asegúrate de reemplazar esto con un token seguro
        }

        response = requests.post(url_api, json=data_api, headers=headers)

        if response.status_code == 200:
            print("Respuesta API:", response.json())
        else:
            print(f"Error en la solicitud: {response.status_code} - {response.text}")

        return response

    except requests.exceptions.RequestException as e:
        print("Error al enviar la solicitud:", e)
        return None



# Corriendo la app
if __name__ == '__main__':
    app.run(port=8000, debug=False, host='0.0.0.0')
