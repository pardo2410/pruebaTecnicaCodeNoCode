# Contenido del repositorio
1.	Carpeta data: Archivos base y Output generados por la ejecución de los Scripts en Google Sheets.
2.	Modelo_de_datos_JuanDavidPardo: Diagrama de la estructura de la base de datos en SQL elaborado en drawio.
3.	Readme.md: Propuesta de automatización. 
4.	appScripts.js: Consolidado de los Scripts preliminares creados para Google Sheets.
5.	modelo_de_datos_keepcoding: Archivo SQL que contiene el Script para generar el modelo de datos y la carga.

## Propuesta de Automatización

La propuesta de automatización presentada a Keepcoding consiste en el desarrollo e implementación de una serie de mejoras que permitan minimizar las interacciones con los reportes asociados a los eventos educativos. Facilitando la descarga, procesamiento y carga de los mismos a la base de datos de la compañía.

Con el objetivo de mejorar el proceso de generación de los reportes se propone crear una serie de Scripts en Google Sheets utilizando la extensión App Script. A continuación, se describe los Scripts recomendados:

***1.	Script para extraer la información asociada a los eventos:*** La información de eventos que se encuentra contenida en cada una de las hojas del reporte se extrae y posteriormente se almacena en una hoja denominada “Eventos”.

### Acciones efectuadas por script:

*	Obtiene la hoja activa del archivo de Google Sheets.
*	Crea una nueva hoja denominada ‘Eventos’ o limpia la existente si ya está ya existe.
*	Itera sobre todas las hojas del archivo de Google Sheets.
*	Obtiene los datos de las celdas B3 a B6 de cada hoja.
*	Almacena esos datos en diferentes arrays (datosB3 a datosB6).
*	Agrega los encabezados a la nueva hoja ‘Eventos’.
*	Copia los datos de los arrays a la hoja ‘Eventos’ en las posiciones adecuadas.

### Prototipo de Script Sugerido:

```
function consolidarDatosEventos() {
  // Definir el archivo activo
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  
  // Crear una nueva hoja donde consolidar los datos
  var hojaConsolidada = spreadsheet.getSheetByName('Eventos');
  if (!hojaConsolidada) {
    hojaConsolidada = spreadsheet.insertSheet('Eventos');
  } else {
    // Limpiar la hoja si ya existe
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
    
  // Obtener los datos de las celdas B3 a B6 de cada hoja
    var rangoB3 = hoja.getRange('B3');
    var datosB3Hoja = rangoB3.getValues();
    datosB3.push.apply(datosB3, datosB3Hoja);
    
    var rangoB4 = hoja.getRange('B4');
    var datosB4Hoja = rangoB4.getValues();
    datosB4.push.apply(datosB4, datosB4Hoja);
    
    var rangoB5 = hoja.getRange('B5');
    var datosB5Hoja = rangoB5.getValues();
    datosB5.push.apply(datosB5, datosB5Hoja);
    
    var rangoB6 = hoja.getRange('B6');
    var datosB6Hoja = rangoB6.getValues();
    datosB6.push.apply(datosB6, datosB6Hoja);
  }

  // Agregar los encabezados
  var encabezados = ['nombre_evento', 'descripcion_evento', 'fecha_evento', 'url_acceso'];
  hojaConsolidada.getRange(1, 1, 1, encabezados.length).setValues([encabezados]);

  // Pegar los datos de B3 a B6 en la hoja Eventos
  hojaConsolidada.getRange(2, 1, datosB3.length, 1).setValues(datosB3);
  hojaConsolidada.getRange(2, 2, datosB4.length, datosB4[0].length).setValues(datosB4);
  hojaConsolidada.getRange(2, 3, datosB5.length, datosB5[0].length).setValues(datosB5);
  hojaConsolidada.getRange(2, 4, datosB6.length, datosB6[0].length).setValues(datosB6);
}
```

***2.	Script para consolidar la base de participantes:*** Este Script busca generar una tabla única de participantes, consolidando la información contenida en cada una de las hojas del reporte y eliminando duplicados para facilitar la carga a la base de datos.

### Acciones efectuadas por script:

*	Obtiene la hoja activa del archivo de Google Sheets.
*	Intenta obtener la hoja denominada 'Participantes'. Si no existe, la crea. Si ya existe, limpia la hoja eliminando todos los datos.
*	Se crea un array con todas las hojas del archivo de Google Sheets.
*	Define el rango de celdas de las columnas A a F desde la fila 10 en adelante.
*	Crea los encabezados.
*	Itera sobre cada hoja del archivo de Google Sheets.
*	Obtiene el rango de datos de la hoja actual y obtiene los valores de ese rango.
*	Pega los datos en la hoja 'Participantes'.

### Prototipo de Script Sugerido:

```
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
```

***3.	Script para Eliminar Duplicados en la Hoja Participantes:*** Este script examina cada elemento en la hoja ‘Participantes” y elimina cualquier duplicado, preparando la base de datos para su posterior carga.

###Acciones efectuadas por script:

*	Identifica la hoja 'Participantes' del archivo de Google Sheets.
*	Establece el rango de datos en la hoja 'Participantes'.
*	Utiliza un conjunto (Set) para realizar un seguimiento de las filas ya agregadas y eliminar duplicados.
*	Compara cada fila con las filas ya agregadas en el conjunto.
*	Si encuentra una fila duplicada, esta es eliminada de la hoja 'Participantes'.

###Prototipo de Script Sugerido:

```
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
```
***4.	Script para crear la tabla de inscripciones:*** Esta tabla permite generar las relaciones entre el ID del participante (ID) y los ID del evento (ID_evento)

###Acciones efectuadas por script:

* A partir de la información de los correos de los participantes se genera un ID unico para cada participante.
* Con base en los datos asociados al nombre del evento se genera un ID único para cada evento.
* La relacion entres ambos ID's permitira generar las relaciones entre las tablas de Eventos y Participantes.

###Prototipo de Script Sugerido:

```
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

```

***5.	Script para descargar los archivos seran cargados a las base SQL:*** Este script facilita la descarga automática de los archivos necesarios para la carga en la base de datos, convirtiéndolos en formato CSV para su manejo eficiente.

###Acciones efectuadas por el Script:

*	Selecciona las hojas ‘Eventos’ y ‘Participantes’ del archivo en Google Sheets.
*	Llama a la función descargarHojaCSV para convertir y descargar la hoja ‘Eventos’ en formato CSV.
*	Llama a la función descargarHojaCSV para convertir y descargar la hoja ‘Participantes’ en formato CSV.

###Prototipo de Script Sugerido:
```
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

```

***Ejecución automática de Scripts:*** Para simplificar la ejecución de los scripts en Google Sheets, es posible implementar triggers que programen la ejecución automática de los scripts. A continuación, se detallan los pasos para configurar estos triggers:

*	Abre tu proyecto de Google Apps Script.
*	En el menú lateral izquierdo, accede al icono del reloj (Triggers).
*	Selecciona ‘Añadir activador’ ubicado en la esquina inferior derecha.
*	En la ventana emergente, elige la función específica que deseas ejecutar (por ejemplo, consolidarDatosParticipantes, eliminarParticipantesDuplicados, descargarArchivosCarga, etc.) del menú desplegable.
*	Selecciona el tipo de evento. En este caso, opta por ‘spreadsheet’ (basado en acciones).
*	Elige la opción ‘on open’ en el siguiente menú desplegable.
*	Haga clic en ‘Guardar’.

De esta manera queda activado un trigger que ejecutará la función seleccionada automáticamente cada vez que se abra el archivo de Google Sheets.

![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/4688296f-428f-40e1-bcb8-b25447890592)


 
 ![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/5f255800-e2f8-4b47-b9dd-85e82f534ee8)



Con el objetivo de ejecutar los Scripts de manera lógica y secuencial, se ha implementado la función 'ejecutar', la cual se activará como trigger cada vez que se abra el archivo:
```
function ejecutar() {
  consolidarDatosEventos()
  consolidarDatosParticipantes()
  inscripcionID()
  descarga()
}
```  

***Visualización outputs de la implementación de los Scripts:*** A continuación, se presentan capturas de pantalla que muestran los Scripts preliminares en acción:

*Reporte Original
![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/a134851c-c0ba-4f14-b80f-f0cae4f4b249)

 *Reporte Eventos
![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/e4bb7b25-ca30-49e7-b3ed-becca499e391)

 *Reporte Participantes
![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/588057eb-c6b3-475f-b1ba-b8d9ad746127)

 *Output CSV Eventos & Participantes
![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/e20ac116-588f-4516-aa91-16e646510af9)

 

***Diagrama DB en SQL:*** Los Outputs generados por los Script ejecutados en Google Sheets se cargaran mediante instrucciones SQL a la base de datos, diseñada según el siguiente diagrama.

![image](https://github.com/pardo2410/pruebaTecnicaCodeNoCode/assets/10873597/6c4331b3-e299-47f7-9c2e-549ce792adf4)


***Propuesta complementaria:*** Se propone integrar a futuro los reportes de Google Sheets con la infraestructura ofrecida por Google Cloud Service, con el fin de generar una mayor automatización del proceso de almacenamiento (Google Cloud Storage), procesamiento (Google Cloud SQL & Google Cloud Function & Google Cloud Schedualer) y visualización de los datos (Google Data Studio). 



***

- [Juan David Pardo Pinzón](https://www.linkedin.com/in/juan-david-pardo-pinz%C3%B3n/) 😊
- Prueba beca NoCode
- KeepCoding

