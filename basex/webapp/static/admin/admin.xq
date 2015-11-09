(: Web Services RESTXQ para el módulo de Administrador :)
module namespace admin = 'http://udem.edu.co/mins';

(: Borrar Problema :)
declare %rest:path("problem/{$pid}")
%rest:POST
%rest:produces("text/html" )
%output:method("html")
updating function admin:borrar-problema($pid)
{
  let $nombreProblema := concat($pid, '.xml')
  return if(db:exists('data', $nombreProblema)) then
    delete node db:problem[id = $pid]
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
  let $usuario := concat($userid, '.xml')
  return if(db:exists('data', $usuario)) then
    replace value of node db:account[user=$userid]/enable with 'false'
  else
    db:output('El usuario no existe')
};
(:----------------------------------------------------------------------------:)
(: Enviar mensajes a todos los usuarios :)

(:----------------------------------------------------------------------------:)