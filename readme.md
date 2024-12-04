    try:
        conexionBD = mysql.connector.connect(
            host='andrescisd.mysql.pythonanywhere-services.com',
            user='andrescisd',
            password='CISD99rck@',
            database='andrescisd$bd_ricardo'

        )


        https://integracionesiepp.bucketdata.es/integracionesiepp/IEPP-lead/resultadoLead.htm
{
  "id": 11064260,
  "estado": "PERDIDA",
  "rechazomotivo": "NO_VENDIBLE",
  "rechazosubmotivo": "INF"
}


from flask import Flask, render_template, request, jsonify, json
from confi_conn import obtener_conexion
import requests

app = Flask(__name__)
app.secret_key = '454ghgghfg8h9fghjnrjtr'

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')


@app.route('/endpoint-python', methods=['GET', 'POST'])
def execute_code():
    # Leer datos de la solicitud (si se necesita)
    """
    data = request.get_json()  # Devuelve un diccionario de Python
    print(data)

    data = request.json if request.is_json else {}
    new_row = data.get('newRow', None)
    if new_row:
        print(f"Nuevo registro recibido: {new_row}")
    """
    buscar_motivo = "No encaja - No tengo tiempo"
    payload = {
            "id": 11064260,
            "estado": "PERDIDA",
        }
    try:
        with obtener_conexion() as conexion_MySQLdb:
            with conexion_MySQLdb.cursor(dictionary=True) as cursor:
                querySQL = "SELECT rechazomotivo, rechazosubmotivo FROM tbl_respuesta_motivo WHERE motivo LIKE %s"
                cursor.execute(querySQL, (f"%{buscar_motivo}%",))
                data_motivos = cursor.fetchall()

                rechazomotivo = data_motivos[0]['rechazomotivo']
                rechazosubmotivo = data_motivos[0]['rechazosubmotivo']

                # Agregar claves al diccionario existente
                payload.update({
                    "rechazomotivo": rechazomotivo,
                    "rechazosubmotivo": rechazosubmotivo
                })
                print(payload)

                enviar_data_api(payload)
        
        # Respuesta JSON
        return jsonify({"status": "success", "data": data_motivos}), 200
    except Exception as e:
        print(f"Error al obtener los motivos: {e}")
        return jsonify({"status": "error", "message": str(e)}), 500

def enviar_data_api(data_api):
    try:
        url = "https://integracionesiepp.bucketdata.es/integracionesiepp/IEPP-lead/resultadoLead.htm"
        """
        payload = {
            "id": 11064260,
            "estado": "PERDIDA",
            "rechazomotivo": "NO_VENDIBLE",
            "rechazosubmotivo": "INF"
        }
        """
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer tu_token"
        }
        response = requests.post(url, json=data_api, headers=headers)

        print("Estado:", response.status_code)
        print("Respuesta:", response.json())

    except requests.exceptions.RequestException as e:
        print("Error al enviar la solicitud:", e)


# Corriendo la app
if __name__ == '__main__':
    app.run(port=5000, debug=True)


https://www.proveeo.co/api/excel/



# Cargar datos JSON del cuerpo de la solicitud
data = json.loads(request.body)

# Escribe toda la data en un archivo .txt
with open('datos_recibidos.txt', 'a') as file:
    file.write(f"Nuevo registro recibido: {json.dumps(data, indent=4)}\n")

print(f"Datos guardados en archivo: {data}")



def api_excel(request):
    if request.method == 'POST':
        try:
            # Cargar datos JSON del cuerpo de la solicitud
            data = json.loads(request.body)
            record_id = data.get('id')         # Obtiene el campo 'id'
            record_name = data.get('nombre')  # Obtiene el campo 'nombre'

            # Escribe los datos en un archivo .txt
            with open('datos_recibidos.txt', 'a') as file:
                file.write(f"ID: {record_id}, Nombre: {record_name}\n")
            
            print(f"Datos guardados en archivo: ID={record_id}, Nombre={record_name}")
            