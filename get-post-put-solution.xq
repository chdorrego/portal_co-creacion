(: Cada modulo debe tener un namespace :)
module namespace pr = 'http://udem.edu.co/mins';

(: Las anotaciones %rest: determinan cual funcion se ejecuta,
dependiendo de las condiciones del request HTTP :)

declare %rest:path("problem/{$pid}/solution/{$sid}") 
%rest:GET 
%rest:produces("text/html" )
%output:method("html")
function pr:get-problem-solution($pid, $sid) {
let $p := doc( concat('data/',$pid,'.xml') )
let $solucion := $p/problem/solution[position()=$sid]
return 
<html>
<body>
<table>
{
for $e in $solucion//*
return <tr>
<td>{name($e)}</td>
<td>{$e/text()}</td>
</tr>
}
</table>
</body>
</html>
};

declare %rest:path("problem/{$pid}/solution/{$sid}") 
%rest:GET 
%output:method("json")
%output:json("format=jsonml")
%rest:produces( "text/json" )
function pr:get-problem-solution-json($pid, $sid) {
let $p := doc( concat('data/',$pid,'.xml') )
let $solucion := $p/problem/solution[position()=$sid]
return 
<json type='object'>
{$solucion/*}
</json>

};

declare %rest:path("problem/{$pid}/solution/{$sid}") 
%rest:GET 
%rest:produces("text/xml", "application/xml" )
%output:method("xml")
function pr:get-problem-solution-xml($pid, $sid) {
let $p := doc( concat('data/',$pid,'.xml') )
let $solucion := $p/problem/solution[position()=$sid]
return $solucion
};

declare %rest:path("problem/{$pid}/solution")
%rest:POST('{$solucion}')
updating function pr:guardar-solucion($pid, $solucion)
{
  (:guardar solucion:)
  let $p := doc( concat('data/',$pid,'.xml') )
  let $sol := $p/problem
  return
  (:inserta dos nodos de solucion:)
  insert node ($solucion) into $sol
 };
 
 declare %rest:path("problem/{$pid}/solution/{$sid}")
%rest:PUT('{$solucion}')
updating function pr:actualizar-solucion($pid, $solucion, $sid)
{
  let $p := doc( concat('data/',$pid,'.xml') )
  let $sol := $p/problem/solution[position()=$sid]
  return replace node $sol with $sol/$solucion
};
