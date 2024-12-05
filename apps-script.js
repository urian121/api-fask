/**
 * Nota: se debe crear un activador para que dispare esta funcion
 */
function onChange(e) {
  try {
    // Detecta cambios en la hoja activa
    var sheet = e.source.getActiveSheet();
    var lastRow = sheet.getLastRow();

    // Verifica que la última fila no esté vacía
    if (lastRow > 0) {
      var newData = sheet
        .getRange(lastRow, 1, 1, sheet.getLastColumn())
        .getValues();

      // La fila nueva: convierte la fila en un objeto
      var newRow = {
        id: newData[0][0], // Columna 1: id
        motivo: newData[0][1], // Columna 2: motivo de cierre
        estado: newData[0][2], // Columna 3: estado
      };

      // Crea el payload para enviar
      var payload = {
        newRow: newRow,
        timestamp: new Date(),
      };

      // Configura la solicitud para enviar los datos
      var options = {
        method: "post",
        contentType: "application/json",
        payload: JSON.stringify(payload),
      };

      // Envío de datos con manejo básico de errores
      try {
        var response = UrlFetchApp.fetch(
          "https://andrescisd.pythonanywhere.com/endpoint-api-motivos",
          options
        );
        Logger.log("Datos enviados con éxito: " + response.getContentText());
      } catch (error) {
        Logger.log("Error al enviar datos: " + error.toString());
      }
    }
  } catch (error) {
    Logger.log("Error en la función onChange: " + error.toString());
  }
}

/*
function onChange(e) {
  try {
    // Detecta cambios en la hoja activa
    var sheet = e.source.getActiveSheet();
    var lastRow = sheet.getLastRow();
    
    // Verifica que la última fila no esté vacía
    if (lastRow > 0) {
      var newData = sheet.getRange(lastRow, 1, 1, sheet.getLastColumn()).getValues();
      
      // Envía datos al servidor Python
      var payload = {
        newRow: newData[0],
        timestamp: new Date()
      };
      
      var options = {
        method: "post",
        contentType: "application/json",
        payload: JSON.stringify(payload)
      };

      Logger.log("Datos obtenidos de la hoja: " + JSON.stringify(newData));

      // Envío de datos con manejo básico de errores
      try {
        var response = UrlFetchApp.fetch("https://andrescisd.pythonanywhere.com/endpoint-api-motivos", options);
        Logger.log("Datos enviados con éxito: " + response.getContentText());
      } catch (error) {
        Logger.log("Error al enviar datos: " + error.toString());
      }
    }
  } catch (error) {
    Logger.log("Error en la función onChange: " + error.toString());
  }
}
*/
