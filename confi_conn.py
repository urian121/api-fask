import mysql.connector

def obtener_conexion():
    try:
        conexionBD = mysql.connector.connect(
            host='andrescisd.mysql.pythonanywhere-services.com',
            user='andrescisd',
            password='CISD99rck@',
            database='andrescisd$bd_ricardo'
        )
        if conexionBD.is_connected():
            return conexionBD

    except mysql.connector.Error as error:
        print(f"No se pudo conectar: {error}")
        return None