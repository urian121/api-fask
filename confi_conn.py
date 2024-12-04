import mysql.connector

def obtener_conexion():
    try:
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