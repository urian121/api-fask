import mysql.connector

def obtener_conexion():
    try:
        modo_desarrollo = False
        if modo_desarrollo:
            conexionBD = mysql.connector.connect(
                host='andrescisd.mysql.pythonanywhere-services.com',
                user='andrescisd',
                password='CISD99rck@',
                database='andrescisd$bd_ricardo'
            )
        else:
            conexionBD = mysql.connector.connect(
                host='localhost',
                user='',
                password='',
                database='demo_api_ricardo'
            )
        if conexionBD.is_connected():
            # print('Conectado a la base de datos')
            return conexionBD

    except mysql.connector.Error as error:
        print(f"No se pudo conectar: {error}")
        return None