from flask import Flask, render_template, request, jsonify, json
from confi_conn import obtener_conexion

app = Flask(__name__)
app.secret_key = '454ghgghfg8h9fghjnrjtr'

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/conexion/', methods=['GET'])
def conexion():
    conexion = obtener_conexion()
    if conexion:
        return jsonify({"status": "success", "message": "Conexión exitosa a la BD"}), 200
    else:
        return jsonify({"status": "error", "message": "No se pudo conectar a la BD"}), 500


@app.route('/endpoint-python', methods=['POST'])
def execute_code():
    data = request.json
    new_row = data.get('newRow')
    print(f"Nuevo registro recibido: {new_row}")

    
    # Ejecuta tu código Python aquí
    with open('datos_recibidos.txt', 'a') as file:
        file.write(f"Nuevo registro recibido: {new_row}\n")
    
    print(f"Nuevo registro guardado en archivo: {new_row}")

    # Por ejemplo, procesa los datos o guarda en una base de datos
    return {"status": "success", "processed": new_row}, 200


# Corriendo la app
if __name__ == '__main__':
    app.run(port=5000, debug=True)
