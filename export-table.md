import subprocess

@app.route('/exportar/<nombre_tabla>', methods=['GET'])
def exportar(nombre_tabla):
    archivo_salida = f"{nombre_tabla}.sql"  # Nombre del archivo exportado
    try:
        # Configuración para desarrollo o producción
        host = 'andrescisd.mysql.pythonanywhere-services.com'
        user = 'andrescisd'
        password = 'CISD99rck@'
        database = 'andrescisd$bd_ricardo'

        # Comando mysqldump
        comando = [
            "mysqldump",
            "-u", user,
            f"-p{password}",  # Contraseña se pasa directamente
            "--host", host,
            database,
            nombre_tabla
        ]

        # Ejecutar el comando y redirigir a archivo
        with open(archivo_salida, "w") as archivo:
            subprocess.run(comando, stdout=archivo, check=True)

        # Retornar una respuesta HTTP de éxito
        return jsonify({
            "message": f"Tabla '{nombre_tabla}' exportada a '{archivo_salida}'",
            "file": archivo_salida
        }), 200

    except subprocess.CalledProcessError as e:
        return jsonify({
            "error": f"Error al exportar la tabla: {e}"
        }), 500
    except Exception as e:
        return jsonify({
            "error": f"Error general: {e}"
        }), 500
