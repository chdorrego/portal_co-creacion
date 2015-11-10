(: Cada modulo debe tener un namespace :)
module namespace pr = 'http://udem.edu.co/mins';

(: Las anotaciones %rest: determinan cual funcion se ejecuta,
dependiendo de las condiciones del request HTTP :)

declare %rest:path("problem/{$pid}/solution/{$sid}/review") 
%rest:GET 
%rest:produces("text/html" )
%output:method("html")
function pr:get-solution-review($pid, $sid) {
let $p := doc( concat('data/',$pid,'.xml') )
let $review := $p/problem/solution[position()=$sid]/review
return 
<html>
<body>
<table>
{
for $e in $review//*
return <tr>
<td>{name($e)}</td>
<td>{$e/text()}</td>
</tr>
}
</table>
</body>
</html>
};

declare %rest:path("problem/{$pid}/solution/{$sid}/review") 
%rest:GET 
%output:method("json")
%output:json("format=jsonml")
%rest:produces( "text/json" )
function pr:get-solution-review-json($pid, $sid) {
let $p := doc( concat('data/',$pid,'.xml') )
let $review := $p/problem/solution[position()=$sid]/review
return 
<json type='object'>
{$review/*}
</json>
};

declare %rest:path("problem/{$pid}/solution/{$sid}/review") 
%rest:GET 
%rest:produces("text/xml", "application/xml" )
%output:method("xml")
function pr:get-solution-review-xml($pid, $sid) {
let $p := doc( concat('data/',$pid,'.xml') )
let $review := $p/problem/solution[position()=$sid]/review
return $review
};

declare %rest:path("problem/{$pid}/solution/{$sid}/review")
%rest:POST('{$review}')
updating function pr:guardar-solucion-review($pid, $sid, $review)
{
  let $p := doc( concat('data/',$pid,'.xml') )
  let $rev := $p/problem/solution[position()=$sid]
  return
  (:inserta dos nodos de review:)
  insert node ($review) into $rev
 };
 
  declare %rest:path("problem/{$pid}/solution/{$sid}/review/{$rid}")
%rest:PUT('{$review}')
updating function pr:actualizar-solucion-review($pid, $review, $sid, $rid)
{
  let $p := doc( concat('data/',$pid,'.xml') )
  let $rev := $p/problem/solution[position()=$sid]/review[position()=$rid]
  return replace node $rev with $rev/$review
};

