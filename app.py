from flask import Flask, request

app = Flask(__name__)

@app.route('/endpoint-python', methods=['POST'])
def execute_code():
    data = request.json  # Recibe datos de Google Sheets
    new_row = data.get('newRow')
    print(f"Nuevo registro recibido: {new_row}")

    
    # Ejecuta tu código Python aquí
        # Escribe los datos en un archivo .txt
    with open('datos_recibidos.txt', 'a') as file:
        file.write(f"Nuevo registro recibido: {new_row}\n")
    
    print(f"Nuevo registro guardado en archivo: {new_row}")

    # Por ejemplo, procesa los datos o guarda en una base de datos
    return {"status": "success", "processed": new_row}, 200


@app.route('/')
def index():
    return 'Hello, World!'


if __name__ == '__main__':
    app.run(port=5000)
