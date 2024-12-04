from flask import Flask, render_template, jsonify, request
from confi_conn import obtener_conexion
import requests

app = Flask(__name__)
app.secret_key = '454ghgghfg8h9fghjnrjtr'

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/endpoint-python', methods=['GET', 'POST'])
def execute_code():
    try:
        # Verifica el Content-Type
        if request.is_json:
            data = request.get_json()  # Obtiene el cuerpo JSON
            new_row = data.get('newRow', {})
            timestamp = data.get('timestamp', '')
            
            # Puedes procesar los datos aquí
            print(f"Nuevo registro recibido: {new_row}")
            print(f"Timestamp: {timestamp}")

        print(f"Datos recibidos: {new_row}")

        # Escribe los datos en un archivo .txt
        with open('datos_recibidos.txt', 'a') as file:
            file.write(f"{new_row}\n")

        print(f"Nuevo registro guardado en archivo: {new_row}")

        buscar_motivo = "No encaja - Ladrón de tiempo"
        payload = {
            "id": 11064260,
            "estado": "PERDIDA",
        }
        with obtener_conexion() as conexion_MySQLdb:
            with conexion_MySQLdb.cursor(dictionary=True) as cursor:
                querySQL = "SELECT rechazomotivo, rechazosubmotivo FROM tbl_respuesta_motivo WHERE motivo LIKE %s"
                cursor.execute(querySQL, (f"%{buscar_motivo}%",))
                data_motivos = cursor.fetchall()

                # Verificar si se encontraron motivos
                if not data_motivos:
                    return jsonify({"status": "error", "message": "No se encontraron motivos"}), 404

                rechazomotivo = data_motivos[0]['rechazomotivo']
                rechazosubmotivo = data_motivos[0]['rechazosubmotivo']

                # Agregar claves al diccionario existente
                payload.update({
                    "rechazomotivo": rechazomotivo,
                    "rechazosubmotivo": rechazosubmotivo
                })

                # Enviar los datos al API
                enviar_data_api(payload)

        # Respuesta JSON
        return jsonify({"status": "success", "data": data_motivos}), 200

    except Exception as e:
        print(f"Error al procesar la solicitud: {e}")
        return jsonify({"status": "error", "message": str(e)}), 500



def enviar_data_api(data_api):
    try:
        url_api = "https://integracionesiepp.bucketdata.es/integracionesiepp/IEPP-lead/resultadoLead.htm"
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer tu_token"
        }
        response = requests.post(url_api, data=data_api, headers=headers)

        print("Estado:", response.status_code)
        print("Respuesta:", response.json())

    except requests.exceptions.RequestException as e:
        print("Error al enviar la solicitud:", e)


# Corriendo la app
if __name__ == '__main__':
    app.run(port=8000, debug=True)
