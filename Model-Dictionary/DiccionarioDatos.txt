==============================
Cuentas 
==============================
Nombre de la colección: account 
Diccionario Account: 

<user/> : id del usuario. Nombre único diferenciador frente a otros usuarios. NO NULL
<name/> : Nombres y apellidos del usuario. NO NULL 
<email/> : Correo electrónico del usuario. NO NULL
<password/> : Contraseña del usuario. NO NULL
<enable/> : Estado del usuario el el sistema.  "true" - habilitado (por defecto), "false" deshabilitado. NO NULL
<role/> : Rol del usuario. "admin" - administrador, "user" - usuario regular (por defecto). NO NULL 
<creation-date/> : Fecha de creación del usuario en la base de datos. NO NULL

Nota: el nombre del documento en la base de datos es equivalente al valor de la etiqueta <user/>

==============================
Problemas 
==============================
Nombre de la colección: problem 
Diccionario Problem: 

<creation-date/> : fecha de creación del problema. NO NULL
<id/> : Identificador único del problema, UUID. NO NULL
<category/> : Categoría del problema. REPETIBLE.  
<title/> : Título del problema. NO NULL
<description/> : Descripción del problema. NO NULL
<user/> : id del usuario creador del problema. NO NULL
<attachment/>: Ruta de elementos adjuntos. REPETIBLE 
<review> : REPETIBLE 
	<creation-date> : fecha de creación del comentario del problema. NO NULL. 
	<user/> : id del usuario creador del comentario del problema (review). NO NULL
	<ranking/> : Calificación por parte del creador del comentario. Número entero entre 0-5. O Bajo, 5 Alto. NO NULL
	<comment/> : Descripción del comentario del problema. 
</review>
<solution> : REPETIBLE
	<creation-date> : fecha de creación de la solución. NO NULL. 
	<title/> : Título de la solución. NO NULL
	<description/> : Descripción de la solución. NO NULL 
	<user/> : id del usuario creador de la solución. NO NULL
	<attachment/> : Ruta del elemento adjunto a la solución. 
	<review> : REPETIBLE 
	  <creation-date/> : fecha de creación del comentario de la solución. NO NULL
	  <user/> :  id del usuario creador del comentario de la solución (review). NO NULL
	  <ranking/> : Calificación por parte del creador del comentario de la solución. Número entero entre 0-5. O Bajo, 5 Alto. NO NULL
	  <comment/> : Descripción del comentario de la solución. 
	</review>
</solution>

Nota: el nombre del documento en la base de datos es equivalente a al valor de la etiqueta <id/>

*************
Aclaraciones 
NO NULL: El valor del elemento no puede ser vacío. 
REPETIBLE: El elemento (etiqueta) se puede repetir 
