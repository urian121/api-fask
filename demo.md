from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/endpoint-python/', methods=['POST'])
def recibir_datos():
    try:
        if request.is_json:
            data = request.get_json()  # Obtiene los datos JSON
            new_row = data.get('newRow', {})
            timestamp = data.get('timestamp', '')
            
            print(f"Nuevo registro recibido: {new_row}")
            print(f"Timestamp: {timestamp}")
            
            return jsonify({"message": "Datos recibidos correctamente", "status": "success"}), 200
        else:
            return jsonify({"message": "El contenido no es JSON", "status": "error"}), 400
    except Exception as e:
        return jsonify({"message": f"Error al procesar los datos: {str(e)}", "status": "error"}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)  # Ejecutar en el puerto 5000




function onChange(e) {
  try {
    var sheet = e.source.getActiveSheet();
    var lastRow = sheet.getLastRow();
    
    if (lastRow > 0) {
      var newData = sheet.getRange(lastRow, 1, 1, sheet.getLastColumn()).getValues();
      
      var newRow = {
        id: newData[0][0],  // Columna 1: id
        motivo: newData[0][1],  // Columna 2: motivo de cierre
        estado: newData[0][2]   // Columna 3: estado
      };
      
      var payload = {
        newRow: newRow,
        timestamp: new Date()
      };
      
      var options = {
        method: "post",
        contentType: "application/json",
        payload: JSON.stringify(payload)
      };
      
      try {
        // Cambia la URL para apuntar a tu servidor local
        var response = UrlFetchApp.fetch("http://127.0.0.1:5000/endpoint-python/", options);
        Logger.log("Datos enviados con éxito: " + response.getContentText());
      } catch (error) {
        Logger.log("Error al enviar datos: " + error.toString());
      }
    }
  } catch (error) {
    Logger.log("Error en la función onChange: " + error.toString());
  }
}
