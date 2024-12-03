import mysql.connector

def obtener_conexion():
    try:
        conexionBD = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='bd_sistema_colegio_python_flask'
        )
        if conexionBD.is_connected():
            # print("Conexión exitosa a la BD")
            return conexionBD

    except mysql.connector.Error as error:
        print(f"No se pudo conectar: {error}")
        return None