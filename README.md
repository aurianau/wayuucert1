Nombre del aplicativo: WAYUUCERT
Nombres : Anderson Uriana Uriana
•	Problema que aborda
En muchas comunidades indígenas Wayuu, los censos de población y la certificación de miembros se realizan de forma manual, en cuadernos o documentos informales.
Esto genera varios problemas:
•	Pérdida de información o datos inconsistentes.
•	Dificultad para verificar si un miembro pertenece realmente a la comunidad.
•	Procesos lentos para generar certificaciones solicitadas por instituciones (salud, educación, bienestar familiar, etc.).
•	El líder comunitario debe escribir certificados uno por uno, lo que aumenta errores.
•	Solución propuesta.
WayuuCert es un aplicativo móvil que permite:
•	Registrar miembros de una comunidad Wayuu.
•	Mantener un censo digital actualizado.
•	Consultar en tiempo real la información registrada.
•	Generar certificados en PDF solo para personas que están registradas en el censo.
Esto facilita los procesos institucionales y garantiza información más confiable.
•	Alcance principal (módulos clave).
Módulo	Descripción
Inicio (HomePage)	Pantalla de bienvenida con acceso a Líder y Miembro.
Módulo Líder	Permite registrar miembros y ver el censo completo.
Registrar Miembro	Guarda nombre, documento y comunidad en una base de datos local.
Ver Censo	Lista todos los miembros registrados.
Módulo Miembro (Generar Certificación)	Valida si el miembro está censado; si lo está, genera la certificación en PDF.
•	Tecnologías usadas.
•	Flutter (Framework principal)
•	Dart (Lenguaje de programación)
•	Floor (ORM para base de datos SQLite)
•	SQLite (Base de datos local)
•	printing / pdf (Generación de PDFs)
•	Material Design (UI)
•	Android Studio (Desarrollo y emuladores)

2.	DESCRIPCIÓN DE LA NECESIDAD
Situación actual
•	Los censos Wayuu se hacen en papel → pueden perderse.
•	No existe un sistema rápido para confirmar si alguien pertenece a una comunidad.
•	Generación de certificaciones manuales → toma tiempo y se cometen errores.
•	Instituciones exigen certificaciones oficiales y verificables.
Usuarios afectados
•	Líderes de comunidad Wayuu → No tienen control digital de la información.
•	Miembros de la comunidad → No pueden obtener certificados de forma ágil.
•	Instituciones (salud, educación, bienestar familiar, alcaldías) → Necesitan validación confiable.
Beneficios esperados
•	Organización y almacenamiento digital del censo.
•	Certificaciones rápidas y sin errores.
•	Validación automática del censo → evita fraudes.
•	Ahorro de tiempo para líderes y miembros.
•	Facilidad para instituciones que requieren certificados.

3.	REQUERIMIENTOS
3.1.	Requerimientos Funcionales (RF)
4.	•  RF01 – El sistema debe permitir registrar un miembro con nombre, documento y comunidad.
5.	•  RF02 – El sistema debe almacenar los miembros en una base de datos SQLite local.
6.	•  RF03 – El sistema debe permitir consultar todos los miembros registrados.
7.	•  RF04 – El sistema debe validar si un miembro existe antes de generar una certificación.
8.	•  RF05 – El sistema debe generar un certificado en formato PDF.
9.	•  RF06 – El sistema debe mostrar mensajes de confirmación al guardar información.

9.1.	Requerimientos No Funcionales (RNF)
Categoría	Requerimiento
Rendimiento	La consulta de miembros debe tomar menos de 2 segundos.
Usabilidad	La interfaz debe ser simple, con máximo 2 clics para registrar o consultar.
Seguridad	No debe generar certificaciones si el miembro no está censado.
Disponibilidad	La aplicación debe funcionar sin internet (modo local).
Restricciones	La app debe ser desarrollada con Flutter y usar SQLite mediante Floor.

10.	DISEÑO DE DATOS
Diagrama Entidad–Relación (ER)
 

11.	ARQUITECTURA, PATRONES DE DISEÑO. 
La aplicación sigue una arquitectura por capas, muy utilizada en apps Flutter:
Capa 1 – Presentación (UI)
•	Pantallas como HomePage, LiderScreen, RegistrarMiembroScreen, VerCensoScreen, MiembroScreen.
•	Responsables de la interfaz gráfica y navegación.
Capa 2 – Lógica / Controladores
•	Métodos para guardar, consultar y validar información.
Capa 3 – Datos (Data Layer)
•	Floor como ORM.
•	SQLite como base de datos interna local.
•	Archivos:
o	miembro_entity.dart
o	miembro_dao.dart
o	app_database.dart
Patrón aplicado
•	DAO (Data Access Object)
Separa el acceso a la base de datos de la lógica del negocio.
•	Repository Pattern (forma básica)
El DAO actúa como repositorio que maneja los datos.
Ventajas de esta arquitectura
•	Fácil mantenimiento.
•	Código ordenado y modular.
•	Cambios en interfaz no afectan la base de datos.
•	Ideal para apps educativas y comunitarias.
