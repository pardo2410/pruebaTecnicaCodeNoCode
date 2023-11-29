// consolidarEventos

function consolidarDatosEventos() {
    // Definir el archivo activo
    var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
    
    // Crear una nueva hoja consolidada
    var hojaConsolidada = spreadsheet.getSheetByName('Eventos');
    if (!hojaConsolidada) {
      hojaConsolidada = spreadsheet.insertSheet('Eventos');
    } else {
      // Limpiar la hoja consolidada si ya existe
      hojaConsolidada.clear();
    }
    
    // Obtener todas las hojas del archivo
    var hojas = spreadsheet.getSheets();
    
    // Array para almacenar los datos de B3 a B6
    var datosB3 = [];
    var datosB4 = [];
    var datosB5 = [];
    var datosB6 = [];
  
    // Iterar sobre cada hoja
    for (var i = 0; i < hojas.length; i++) {
      var hoja = hojas[i];
      
      // Obtener los datos de B3 de la hoja actual
      var rangoB3 = hoja.getRange('B3');
      var datosB3Hoja = rangoB3.getValues();
      datosB3.push.apply(datosB3, datosB3Hoja);
      
      // Obtener los datos de B4de la hoja actual
      var rangoB4 = hoja.getRange('B4');
      var datosB4Hoja = rangoB4.getValues();
      datosB4.push.apply(datosB4, datosB4Hoja);
      
      // Obtener los datos de B5 de la hoja actual
      var rangoB5 = hoja.getRange('B5');
      var datosB5Hoja = rangoB5.getValues();
      datosB5.push.apply(datosB5, datosB5Hoja);
      
      // Obtener los datos de B6 de la hoja actual
      var rangoB6 = hoja.getRange('B6');
      var datosB6Hoja = rangoB6.getValues();
      datosB6.push.apply(datosB6, datosB6Hoja);
    }
    // Agregar los encabezados
    var encabezados = ['nombre_evento', 'descripcion_evento', 'fecha_evento', 'url_acceso'];
    hojaConsolidada.getRange(1, 1, 1, encabezados.length).setValues([encabezados]);
  
    // Pegar los datos de B3 a B6 en la hoja consolidada
    hojaConsolidada.getRange(2, 1, datosB3.length, 1).setValues(datosB3);
    hojaConsolidada.getRange(2, 2, datosB4.length, datosB4[0].length).setValues(datosB4);
    hojaConsolidada.getRange(2, 3, datosB5.length, datosB5[0].length).setValues(datosB5);
    hojaConsolidada.getRange(2, 4, datosB6.length, datosB6[0].length).setValues(datosB6);
  }

// consolidarParticipantes


  function consolidarDatosParticipantes() {
    // Definir el archivo activo
    var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  
    // Crear una nueva hoja consolidada de Participantes
    var hojaConsolidada = spreadsheet.getSheetByName('Participantes');
    if (!hojaConsolidada) {
      hojaConsolidada = spreadsheet.insertSheet('Participantes');
    } else {
      // Limpiar la hoja consolidada si ya existe
      hojaConsolidada.clear();
    }
  
    // Obtener todas las hojas del archivo
    var hojas = spreadsheet.getSheets();
  
    // Definir el rango que va de A a F inciando en la fila 10 
    var rangoInicial = 'A10:F';
  
    // Agregar los encabezados
    var encabezados = ['nombre', 'apellidos', 'correo_electronico', 'poblacion', 'provincia_estado','pais'];
    hojaConsolidada.getRange(1, 1, 1, encabezados.length).setValues([encabezados]);
  
    // Iterar sobre cada hoja
    for (var i = 0; i < hojas.length; i++) {
      var hoja = hojas[i];
  
      // Obtener el rango que deseas consolidar en la hoja actual
      var rangoHoja = hoja.getRange(rangoInicial);
  
      // Obtener los datos del rango
      var datos = rangoHoja.getValues();
  
      // Obtener la última fila ocupada en la hoja consolidada
      var ultimaFilaConsolidada = hojaConsolidada.getLastRow();
  
      hojaConsolidada.getRange(ultimaFilaConsolidada + 1, 1, datos.length, datos[0].length).setValues(datos);
    
    }
  }

// eliminarParticipantesDuplicados

  function eliminarParticipantesDuplicados() {
    // Definir el archivo activo
    var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  
    // Obtener la hoja consolidada
    var hojaConsolidada = spreadsheet.getSheetByName('Participantes');
  
    // Definir el rango de datos en la hoja consolidada
    var datosConsolidados = hojaConsolidada.getDataRange().getValues();
  
    var filasAgregadas = new Set();
  
    // Recorrer los datos en sentido inverso para eliminar duplicados
    for (var i = datosConsolidados.length - 1; i >= 1; i--) {
      var filaActual = datosConsolidados[i].join(); 
      if (filasAgregadas.has(filaActual)) {
        // Eliminar la fila duplicada
        hojaConsolidada.deleteRow(i + 1);
      }
      filasAgregadas.add(filaActual);
      
    }
  }


// inscripcionID

function inscripcionID() {
    // Definir el archivo activo
    var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  
    // Crear una nueva hoja consolidada de Inscripciones
    var hojaConsolidada = spreadsheet.getSheetByName('Inscripciones');
    if (!hojaConsolidada) {
      hojaConsolidada = spreadsheet.insertSheet('Inscripciones');
    } else {
      // Limpiar la hoja consolidada si ya existe
      hojaConsolidada.clear();
    }
  
    // Obtener todas las hojas del archivo
    var hojas = spreadsheet.getSheets();
  
    // Definir el rango que va de A a F iniciando en la fila 10 
    var rangoInicial = 'C10:C';
  
    // Agregar los encabezados
    var encabezados = ['ID', 'correo_electronico', 'nombre_evento', 'ID_evento'];
    hojaConsolidada.getRange(1, 1, 1, encabezados.length).setValues([encabezados]);
  
    // Crear mapas para almacenar los IDs asociados a los correos electrónicos y nombres de eventos únicos
    var mapaIDsCorreo = {};
    var mapaIDsEvento = {};
  
    // Iterar sobre cada hoja
    for (var i = 0; i < hojas.length; i++) {
      var hoja = hojas[i];
  
      // Obtener los datos de B3 de la hoja actual
      var rangoB3 = hoja.getRange('B3');
      var datosB3Hoja = rangoB3.getValue();
  
      // Obtener el rango que deseas consolidar en la hoja actual
      var rangoHojaCorreo = hoja.getRange('C10:C');
      var rangoHojaEvento = hoja.getRange('B3');
  
      // Obtener los datos del rango
      var datosCorreo = rangoHojaCorreo.getValues();
      var datosEvento = [[datosB3Hoja]];
  
      // Filtrar filas con datos existentes
      datosCorreo = datosCorreo.filter(function(fila) {
        return fila[0] !== '';
      });
  
      if (datosCorreo.length > 0) {
        // Iterar sobre los datos y asignar IDs numéricos a los correos electrónicos únicos
        for (var j = 0; j < datosCorreo.length; j++) {
          var correoElectronico = datosCorreo[j][0];
  
          if (!mapaIDsCorreo.hasOwnProperty(correoElectronico)) {
            // Asignar un nuevo ID numérico si el correo electrónico no está en el mapa
            mapaIDsCorreo[correoElectronico] = Object.keys(mapaIDsCorreo).length + 1;
          }
        }
  
        // Obtener la última fila ocupada en la hoja consolidada
        var ultimaFilaConsolidada = hojaConsolidada.getLastRow();
  
        // Asignar IDs numéricos a los correos electrónicos en la hoja consolidada
        var idsCorreo = datosCorreo.map(function(fila) {
          return [mapaIDsCorreo[fila[0]]];
        });
  
        // Asignar un ID único al evento en la hoja consolidada
        var nombreEvento = datosEvento[0][0];
        if (!mapaIDsEvento.hasOwnProperty(nombreEvento)) {
          mapaIDsEvento[nombreEvento] = Object.keys(mapaIDsEvento).length + 1;
        }
        var idEvento = mapaIDsEvento[nombreEvento];
  
        // Pegar los datos en la hoja consolidada, incluyendo los IDs y el nombre del evento
        hojaConsolidada.getRange(ultimaFilaConsolidada + 1, 1, datosCorreo.length, 1).setValues(idsCorreo);
        hojaConsolidada.getRange(ultimaFilaConsolidada + 1, 2, datosCorreo.length, 1).setValues(datosCorreo);
        hojaConsolidada.getRange(ultimaFilaConsolidada + 1, 3, datosCorreo.length, 1).setValue(nombreEvento);
        hojaConsolidada.getRange(ultimaFilaConsolidada + 1, 4, datosCorreo.length, 1).setValue(idEvento);
      }
    }
  }

  



//   descargaReporteCSV

function descarga(){
    function descargarCSV() {
      var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
      archivos = ['Participantes','Eventos','Inscripciones']
      // Descargar la hoja "Participantes"
      for(var i = 0; i < archivos.length; i++){
        descargarHojaCSV(spreadsheet, archivos[i]);
      }
    }
  
    function descargarHojaCSV(spreadsheet, hojaNombre) {
      // Obtener la hoja por nombre
      var hoja = spreadsheet.getSheetByName(hojaNombre);
      
      // Obtener los datos de la hoja
      var datos = hoja.getDataRange().getValues();
  
      // Convertir los datos a una cadena CSV
      var csv = convertirDatosACSV(datos);
  
      // Crear un archivo CSV
      var blob = Utilities.newBlob(csv, 'application/octet-stream', hojaNombre + '.csv');
      
      // Crear el archivo CSV en Google Drive y obtener la URL de descarga
      var urlDescarga = DriveApp.createFile(blob).getDownloadUrl();
      
      // Abrir la URL de descarga en una nueva ventana del navegador
      var html = '<script>window.open("' + urlDescarga + '");</script>';
      var userInterface = HtmlService.createHtmlOutput(html);
      SpreadsheetApp.getUi().showModelessDialog(userInterface, 'Descarga de CSV');
    }
  
    function convertirDatosACSV(datos) {
      var csv = "";
      for (var i = 0; i < datos.length; i++) {
        csv += datos[i].join(",") + '\n';
      }
      return csv;
      
    }
    descargarCSV()
}


//   Funcion de ejecucion

function ejecutar() {
    consolidarDatosEventos()
    consolidarDatosParticipantes()
    inscripcionID()
    descarga()
  }
  