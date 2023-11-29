-- Modelo de Datos Keepcoding
-- Juan David Pardo Pinzon

-- Creamos el Esquema

create schema modelo_de_datos;

-- A continuación, creamos todas las tablas con sus claves primarias

create table modelo_de_datos.participantes (
	id serial primary key,
	nombres varchar (80) not null,
	apellidos varchar (80) not null,
	correo_electronico varchar (80) not null,
	poblacion varchar (80) not null,
	provincia_estado varchar (80) not null,
	pais varchar (80) not null
);


create table modelo_de_datos.eventos (
	id_evento serial primary key,
	nombre_evento varchar (80) not null,
	descripcion_evento varchar (2000) not null,
	fecha_evento date not null,
	url_acceso varchar (100) not null
);


create table modelo_de_datos.inscripcion_eventos (
	id_inscripcion_evento serial primary key,
	id_participante int not null,
	id_evento int not null
);

-- Una vez creadas las tablas, podemos proceder a crear las relaciones

alter table modelo_de_datos.inscripcion_eventos add constraint pk_inscripcion_eventos_participantes foreign key (id_participante) references modelo_de_datos.participantes(id);
alter table modelo_de_datos.inscripcion_eventos add constraint pk_inscripcion_eventos_eventos foreign key (id_evento) references modelo_de_datos.eventos(id_evento);


--- Ahora cargamos todos los datos

insert into modelo_de_datos.eventos (id_evento, nombre_evento, descripcion_evento, fecha_evento, url_acceso)
values (1, 'Estrategias Avanzadas de Ciberseguridad en 2024', 'Un análisis profundo de las estrategias de ciberseguridad para proteger infraestructuras críticas. Este webinar cubrirá temas como seguridad en la nube, criptografía avanzada y defensa contra ciberataques emergentes.', '2024/02/05', 'https://zoom.us/j/7778889999?pwd=cYb3rS3c2024'),
(2, 'Desarrollo Web Moderno: Tendencias y Tecnologías', 'Explora las últimas tendencias en desarrollo web, incluyendo frameworks modernos, diseño responsivo y mejores prácticas para crear aplicaciones web efectivas.', '2024/01/20', 'https://zoom.us/j/4445556666?pwd=d3vWeb2024'),
(3, 'Fundamentos de Python para Principiantes', 'Una introducción completa al lenguaje de programación Python, enfocada en principiantes. Aprenderás las bases del lenguaje, estructuras de datos y cómo empezar tu primer proyecto en Python.', '2023/12/15', 'https://zoom.us/j/1112223333?pwd=pyth0nBeg1');


insert into modelo_de_datos.participantes (nombres, apellidos, correo_electronico, poblacion,provincia_estado, pais)
values ('Rebekah','Johnson','tkelley@example.net','Adrianview','Michigan','Andorra'),
('Barbara','Williams','radams@example.net','','South Dakota','Anguilla'),
('Jerome','Fox','fullerjustin@example.com','Brandihaven','Arizona','Albania'),
('Michelle','Gonzalez','wroberts@example.net','Port Jordan','Georgia','Tajikistan'),
('Jessica','Moreno','matthew69@example.com','North Larry','','Cayman Islands'),
('Erica','Bates','yorkbrad@example.net','Lake Traci','Wyoming','Burundi'),
('Roberto','Hart','brett11@example.net','Randallburgh','Tennessee','Barbados'),
('John','Miller','frichards@example.org','','Rhode Island','Ukraine'),
('Roger','Torres','oscar96@example.net','East Seanfort','','Uganda'),
('Maria','Howard','robinsonmatthew@example.com','Patriciaton','','Cocos (Keeling) Islands'),
('Robert','Green','brandi93@example.com','','','Canada'),
('Alexander','Olson','ashleyryan@example.com','Francoland','','Uganda'),
('Ryan','Anderson','brianholloway@example.com','North Barbaramouth','Connecticut','Yemen'),
('Steven','Parks','dannyvazquez@example.com','','','Pakistan'),
('Melissa','White','douglas09@example.org','Mooretown','Nebraska','Uganda'),
('Brian','Merritt','jessicabaker@example.net','Angelicachester','Idaho','Switzerland'),
('Anthony','Rich','amber71@example.org','','South Carolina','Finland'),
('Adam','Meadows','goodmandiane@example.com','Kendrashire','Washington','Saint Kitts and Nevis'),
('Lisa','Cooper','ngutierrez@example.com','','','Latvia'),
('Gloria','Lee','sfreeman@example.com','','','Bolivia'),
('Michael','Watkins','johnsonjeffrey@example.org','','','Faroe Islands'),
('Rachel','Olson','rossjennifer@example.com','','Tennessee','Iraq'),
('Gavin','Meyer','william58@example.org','South Andrewchester','Hawaii','Australia'),
('Michelle','Ellis','stephaniebutler@example.com','New Julieton','','Cuba'),
('William','Diaz','david08@example.org','','Missouri','American Samoa'),
('Jamie','Bauer','henry85@example.net','Judychester','Hawaii','Eritrea'),
('Caitlyn','Moses','donnalopez@example.com','','Louisiana','Bahamas'),
('Christopher','Houston','okhan@example.com','','','Antigua and Barbuda'),
('Jennifer','Park','jonathanstrickland@example.org','','Missouri','Switzerland'),
('Joseph','Davis','kellyfoster@example.org','','','Christmas Island'),
('Jose','Weiss','mcgeejoshua@example.net','','Oregon','Lithuania'),
('Keith','Nelson','terri73@example.net','','Michigan','Kyrgyz Republic'),
('Brandon','Smith','jonesjoseph@example.com','','Tennessee','Israel'),
('Jacob','Owens','kmartin@example.net','South Deanna','Oklahoma','Iran'),
('Brandy','Nguyen','nathancarlson@example.net','Port Rebekah','','Falkland Islands (Malvinas)'),
('Anne','Benson','nathan51@example.org','Joshualand','','Nauru'),
('Zachary','Gonzales','tammy47@example.org','','Louisiana','Cuba'),
('Dennis','Goodwin','lisa02@example.net','North Dalton','','Yemen'),
('Danny','Larson','kathleenfitzgerald@example.org','','Missouri','Burkina Faso'),
('Kristin','Williamson','johnroberson@example.net','South Michael','','Bouvet Island (Bouvetoya)'),
('Caleb','Smith','smithaustin@example.com','Fernandeztown','','Kuwait'),
('Kathleen','Alvarado','darren50@example.net','','Florida','South Georgia and the South Sandwich Islands'),
('Jody','Smith','williamsrobert@example.org','','Wyoming','Marshall Islands'),
('Julia','Herrera','timothymcdowell@example.com','Jamesfort','California','Lesotho'),
('Melissa','Jones','fmartin@example.com','East David','Rhode Island','Comoros'),
('Marilyn','Miles','kmartinez@example.org','','Nevada','Dominican Republic'),
('Mark','Douglas','shammond@example.com','Leeberg','','Malawi'),
('Patricia','Gomez','john45@example.org','','Kansas','Mauritania'),
('Dale','Gilmore','collierdebra@example.net','','','Bahamas'),
('Kenneth','Russell','steven61@example.org','Mitchellfurt','Wisconsin','Saint Helena'),
('Brandon','White','whiteshawn@example.org','','','Lithuania'),
('Ashley','Miller','dmoses@example.org','','','United Arab Emirates'),
('James','Reid','ganderson@example.com','','','Cocos (Keeling) Islands'),
('Crystal','Blankenship','pbrown@example.org','Saraberg','Nevada','Norfolk Island'),
('Corey','Reyes','kathryngarrett@example.net','','','Cape Verde'),
('Stephen','Cantrell','smithdavid@example.net','','','Armenia'),
('Jonathan','Walters','taylormartin@example.com','Nortonville','','British Indian Ocean Territory (Chagos Archipelago)'),
('Tonya','Travis','amy81@example.org','Sierramouth','','Mali'),
('Eric','Robinson','igriffin@example.org','New Joseph','Hawaii','Albania'),
('Timothy','Davis','richardandrews@example.org','','Arizona','Western Sahara'),
('Ana','Campos','mayraymond@example.com','West Joeport','','Belize'),
('Mitchell','White','rwang@example.net','Sonyaton','North Carolina','Reunion'),
('Brandon','Cook','kgill@example.org','New Connor','Tennessee','Uruguay'),
('Trevor','Potter','jennifer83@example.org','','','United States Virgin Islands'),
('Latoya','Smith','alexanderheidi@example.net','Lake Tammy','','Zambia'),
('Vanessa','Nelson','aliciabaker@example.com','','','Mexico'),
('Randy','Mason','allenmeredith@example.org','','','Sierra Leone'),
('Jesus','Mathis','kathy40@example.org','Jonathanport','','Botswana'),
('Dan','Salinas','matthew49@example.com','Dunnmouth','Montana','Lithuania'),
('Sarah','Lawrence','amyjohnston@example.com','South Meghanmouth','Pennsylvania','Northern Mariana Islands'),
('Renee','Delacruz','kylie00@example.net','Nguyenview','New Hampshire','Eritrea'),
('Kathryn','Garcia','hebertchad@example.com','','North Carolina','Seychelles'),
('Nicole','Harris','owashington@example.org','Shawfurt','Indiana','Tajikistan'),
('Pam','Mann','uwilliams@example.com','Port Ann','Kansas','Bahrain'),
('Misty','Tran','williamskarl@example.org','','','Saint Helena'),
('Darius','Meadows','elizabethpowers@example.net','','Arizona','North Macedonia'),
('Patrick','Simon','dannyolson@example.org','South Tyler','Arizona','Bahamas'),
('Anthony','Orr','hannahmyers@example.net','','','Serbia'),
('Anthony','Page','ureed@example.net','','','Bahamas'),
('Connie','Vargas','michaelbrown@example.com','','','Sweden'),
('Dylan','Carter','michael15@example.net','','','Denmark'),
('Shannon','Patrick','sabrina59@example.com','West Robertfurt','Wyoming','Macao'),
('Lindsey','Brown','smartinez@example.org','West Brandonberg','','Zambia'),
('Christina','Perez','gcox@example.net','Lake Bryanport','','Grenada'),
('Elizabeth','Clarke','harveychristopher@example.com','Blackburnside','','Monaco'),
('Bryan','Spencer','nicholas22@example.org','Lake Alfredfurt','','Martinique'),
('Jennifer','Diaz','darrenbowers@example.net','','Wyoming','Morocco'),
('Luke','Price','rhondawilliams@example.com','','','Albania'),
('Edward','Palmer','qwhite@example.net','Rebekahtown','Kentucky','Bulgaria'),
('Kristi','Berry','lisa39@example.com','','Rhode Island','Mongolia'),
('Thomas','Perez','isampson@example.org','Silvamouth','Washington','Uruguay'),
('Angel','Hernandez','david55@example.com','Xavierhaven','','Swaziland'),
('Lauren','Craig','jamiejohnson@example.org','','Massachusetts','Hungary'),
('Anthony','Taylor','smitheric@example.org','Danielleview','Nevada','Madagascar'),
('Adrian','Vasquez','fholmes@example.org','South Tammyland','','Czech Republic'),
('Priscilla','Russell','michellethompson@example.net','East Heather','Kentucky','Croatia'),
('Maria','Reed','jacksonjennifer@example.com','','','Belize'),
('Benjamin','Frost','daniel51@example.net','','Mississippi','Dominican Republic'),
('Rebecca','Conway','danawinters@example.org','Port Tina','','Comoros'),
('Christopher','Rodriguez','sethsingh@example.net','','Texas','Tanzania'),
('Luis','Luna','wyattfrank@example.net','','','Netherlands'),
('Jessica','Giles','elizabethpearson@example.org','','','Togo'),
('Eric','Shaffer','rhonda20@example.org','','Colorado','Denmark'),
('Haley','Davis','pottsdonald@example.com','North Jonathanfort','Utah','Fiji'),
('Melissa','Jones','michaelmiller@example.com','Johnsonville','Michigan','Cameroon'),
('Donald','Rivera','michaelfriedman@example.com','Edwardland','','Burundi'),
('Jerry','Carter','jocelyn50@example.org','','','Jamaica'),
('Dawn','Richardson','ramirezdustin@example.org','','New York','Sierra Leone'),
('Larry','Bolton','enguyen@example.org','Lake Rebecca','','Sri Lanka'),
('Jonathan','Atkins','tammie48@example.org','Clarkstad','','Belarus'),
('Tyrone','Tran','melanie41@example.net','Brandonstad','','Portugal'),
('Tanner','Brown','barronjeffrey@example.net','','Minnesota','Nicaragua'),
('Kristen','Harris','brockaaron@example.com','South Gloria','Minnesota','Tonga'),
('Deborah','Reynolds','brooke40@example.org','','','Netherlands'),
('Jason','Flores','owenssarah@example.com','Harveychester','Indiana','Cape Verde'),
('William','Hernandez','fvelez@example.net','Chaseview','Indiana','Gambia'),
('Ashley','Norman','jessica78@example.org','','','Gambia'),
('Meghan','Santos','sherri35@example.org','','','Brunei Darussalam'),
('Jason','Hurley','allison15@example.net','','Nebraska','Azerbaijan'),
('Valerie','Hoover','sharongarcia@example.net','Alexberg','South Carolina','Mexico'),
('Michael','Sanchez','melissaramirez@example.com','','California','Mauritania'),
('Susan','Luna','fmiller@example.net','','','Libyan Arab Jamahiriya'),
('Misty','Smith','ismith@example.com','Williamsstad','','Somalia'),
('William','Wong','brianna85@example.net','','','Dominica'),
('Angela','Arnold','rpham@example.org','Pamelachester','','Czech Republic'),
('Timothy','Morris','amandathomas@example.com','','Minnesota','Angola'),
('Kimberly','Ballard','waltoncody@example.com','Calebport','','Sierra Leone'),
('Chelsea','Shaffer','cparker@example.com','','','Cocos (Keeling) Islands'),
('Amy','Coleman','bauermatthew@example.com','','New Hampshire','Norway'),
('Maria','Petersen','johnsonjoshua@example.org','South Darlenemouth','','Hungary'),
('Casey','Li','kbowman@example.com','East Betty','','Guernsey'),
('Nathan','Garner','amanda24@example.com','','','Maldives'),
('Jessica','Smith','millerrobert@example.com','Port Sara','Idaho','Bahamas'),
('Melissa','Vega','rushkevin@example.net','','Hawaii','Bahrain'),
('Melissa','Nelson','michelle15@example.org','','Georgia','Cameroon'),
('James','Woods','mercadojoel@example.org','Montgomerymouth','','French Guiana'),
('Paula','Turner','valeriethompson@example.net','Ericaborough','','Syrian Arab Republic'),
('Sandra','Chang','fboyd@example.net','West Donaldtown','Idaho','Nauru'),
('Amanda','Lam','hernandezangela@example.com','East John','West Virginia','Cayman Islands'),
('Jessica','Garcia','owalker@example.com','Greenton','Pennsylvania','Timor-Leste');

--Nota: la carga realizada anteriormente se efectuo manualmente, la propuesta es que se efectue con base en los archivos csv generados a partir del proceso de automatizacion propuesto  

--Metodo de carga de archivos CSV
--copy eventos from 'C:\Users\pardo\Downloads\Eventos.csv' delimiter ',' csv header;
--copy participantes from 'C:\Users\pardo\Downloads\Participantes.csv' delimiter ',' csv header;
--copy inscripcion_eventos from 'C:\Users\pardo\Downloads\Inscripciones.csv' delimiter ',' csv header;


-- Insertar datos en la tabla inscripcion_eventos
insert into modelo_de_datos.inscripcion_eventos(id_participante, id_evento)
values (1,1),(130,1),(2,1),(44,1),(3,1),(59,1),(113,1),(4,1),(47,1),(5,1),(6,1),(7,1),(8,1),(9,1),(116,1),(108,1),(121,1),(92,1),(10,1),(139,1),(104,1),(128,1),(99,1),(11,1),(12,1),(126,1),(13,1),(134,1),(14,1),(91,1),(15,1),(129,1),(73,1),(16,1),(135,1),(17,1),(18,1),(19,1),(58,1),(20,1),(106,1),(21,1),(96,1),(119,1),(110,1),(22,1),(23,1),(86,1),(24,1),(46,1),(25,1),(26,1),(27,1),(28,1),(29,1),(118,1),(57,1),(30,1),(117,1),(55,1),(75,1),(31,1),(32,1),(33,1),(34,1),(131,1),(42,1),(69,1),(105,1),(77,1),(132,1),(35,1),(36,1),(74,1),(37,1),(38,1),(68,1),(95,1),(61,1),(43,1),(39,1),(82,1),(40,1),(65,1),(103,1),(41,1),(1,2),(130,2),(2,2),(44,2),(3,2),(59,2),(113,2),(4,2),(47,2),(5,2),(6,2),(7,2),(8,2),(9,2),(116,2),(108,2),(121,2),(92,2),(10,2),(139,2),(104,2),(128,2),(99,2),(11,2),(12,2),(126,2),(13,2),(134,2),(14,2),(91,2),(15,2),(129,2),(73,2),(16,2),(135,2),(17,2),(18,2),(19,2),(58,2),(20,2),(106,2),(21,2),(96,2),(119,2),(110,2),(22,2),(23,2),(86,2),(24,2),(46,2),(25,2),(26,2),(27,2),(28,2),(29,2),(118,2),(57,2),(30,2),(117,2),(55,2),(75,2),(31,2),(32,2),(33,2),(34,2),(131,2),(42,2),(69,2),(105,2),(77,2),(132,2),(35,2),(36,2),(74,2),(37,2),(38,2),(68,2),(95,2),(61,2),(43,2),(39,2),(82,2),(40,2),(65,2),(103,2),(41,2),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(121,3),(122,3),(123,3),(124,3),(125,3),(126,3),(127,3),(128,3),(129,3),(130,3),(131,3),(132,3),(133,3),(134,3),(135,3),(136,3),(137,3),(138,3),(139,3),(140,3);

-- Crear la consulta de validacion

--1. Obtener Participantes y sus Inscripciones a Eventos:
select participantes.id, participantes.nombres, participantes.apellidos, eventos.nombre_evento
from modelo_de_datos.participantes
inner join modelo_de_datos.inscripcion_eventos on participantes.id = inscripcion_eventos.id_participante
inner join modelo_de_datos.eventos on inscripcion_eventos.id_evento = eventos.id_evento
order by participantes.id;

--2. Número de Participantes por País:
select pais, count(*) as cantidad_participantes
from modelo_de_datos.participantes
group by pais;


--3. Número de Participantes por evento:
select eventos.id_evento, eventos.nombre_evento, count(distinct inscripcion_eventos.id_participante) as cantidad_participantes
from modelo_de_datos.eventos 
inner join modelo_de_datos.inscripcion_eventos on eventos.id_evento = inscripcion_eventos.id_evento
group by eventos.id_evento, eventos.nombre_evento
order by cantidad_participantes desc;

--4. Número de Participantes:
select count(distinct id_participante) as total_participantes
from modelo_de_datos.inscripcion_eventos;





