(: Web Services RESTXQ para el módulo de Administrador :)
module namespace admin = 'http://udem.edu.co/mins';


(: Borrar Problema :)
declare %rest:path("problem/{$pid}")
%rest:POST
%rest:produces("text/html" )
%output:method("html")
updating function admin:borrar-problema($pid)
{
  let $html := 
  <html>
    <head>
      <title>Borrar Problemas</title>
    </head>
    <body>
    </body>
  </html>
  let $nombreProblema := concat($pid, '.xml')
  return
   if(db:exists('data', $nombreProblema)) then
    (delete node db:problem[id = $pid],
    db:output($html))
  else
    db:output('El problema no existe')
};
(:----------------------------------------------------------------------------:)
(: Borrar Solucion :)
declare %rest:path("problem/{$pid}/solution/{$sid}")
%rest:POST
%rest:produces("text/html" )
%output:method("html")
updating function admin:borrar-solucion($pid, $sid){
    let $html := 
  <html>
    <head>
      <title>Borrar Solucion</title>
    </head>
    <body>
    </body>
  </html>
  let $ruta := concat('data/',$pid, '.xml')
  return delete node $ruta/problem/solution[position()=$sid]
};
(:----------------------------------------------------------------------------:)
(: Bloquear Usuarios :)
declare %rest:path("user/{$userid}")
%rest:POST
%rest:produces("text/html" )
%output:method("html")
updating function admin:bloquear-usuario($userid)
{
  let $html := 
  <html>
    <head>
      <title>Bloquera Usuario</title>
    </head>
    <body>
    </body>
  </html>
  let $usuario := concat($userid, '.xml')   
      return 
      (
          if(db:exists('data', $usuario)) then
            (replace value of node db:account[user=$userid]/enable with 'false',
            db:output($html))    
          else
            db:output('El usuario no existe')      
)};
(: Enviar mensaje a todos los usuarios :)
declare %rest:path("/messages") 
%rest:GET 
%rest:produces("text/html" )
%output:method("html")
function admin:enviar-mensajes(){
  let $html := 
  <html>
    <head>
      <title>Bloquera Usuario</title>
    </head>
    <body>
      From: <input type="text" id="from"/>
      (:To: <input type="text" id="to"/>:)
      Subjec: <input type="text" id="subject"/>
      Message: <input type="text" id="message"/>
    </body>
  </html>
  return $html
};
