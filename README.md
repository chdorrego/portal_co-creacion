Portal de co-creación  
==================

## Inicio 
* En la carpeta ```basex/bin``` ejecutar en:
	* linux/MacOS ```basexhttp.sh ``` 
	* Windows ```basexhttp.bat``` 
* Sobre un servidor local ingresar a la página inicial:
	* ```http://localhost:8984/rest/?run=/problem/home.xq```
* Funciones de administración
	* Desabilitar usuario ```http://localhost:8984/rest/?run=disableUser.xq&user=[userName]```
	* Eliminar problema ```http://localhost:8984/rest/?run=/admin/deleteProblem.xq&idProblem=[idProblem]```

* La descripción del modelo y diccionario de datos se encuentra en la carpeta [Model-Dictionary](/Model-Dictionary)

## Configuraciones adicionales para una correcta ejecución (sobre Basex 8.3) ##
Estos cambios son necesarios para utilizar el [Módulo Session de basex](http://docs.basex.org/wiki/Session_Module) (manejo de sesión en la aplicación).

1. Modificar el archivo ```.basex``` con las direcciones absolutas de la máquina donde se ejecuta el código. 
```DBPATH REPOPATH USER PASSWORD WEBPATH RESTPATH```

1. Para ejecutar basex en windows
Remplazar linea número 8 de ```basexhttp.bat``` por:

	```set CP=%PWD%/../BaseX.jar;%PWD%/../lib/basex-api-8.2.3.jar```

1. Para ejecutar basex en distribuciones linux y MacOS
Remplazar linea número 13 de ```basexhttp``` por: 

	```CP="$BX/BaseX.jar$(printf ":%s" "$BX/lib/"*.jar "$BXCORE/lib/"*.jar):$CLASSPATH""/lib/basex-api-8.2.3.jar"```

#### Nota: Paso 2 y 3 se encuentran en el proyecto. 

## Funcionalidades  
##### Cuentas
* Login
* Cerrar sesión 
* Registro usuarios
* Actualizar datos de usuarios

##### Problemas y soluciones 
* Crear problema
* Valorar problema
* Proponer Solucion
* Valorar Solucion
* Listar problemas y soluciones
* Buscar problemas y soluciones

##### Administración
* Borrar Problemas
* Borrar Soluciones
* Bloquear usuarios
* Enviar mensaje a todos los usuarios

## Colaboradores  
* -
* -
* -

