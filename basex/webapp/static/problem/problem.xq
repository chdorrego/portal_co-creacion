module namespace pi = 'http://udem.edu.co/mins';
declare %rest:path('problem/search/{$id}')
%rest:GET
%rest:produces("text/html")
%output:method("html")
%output:version("5.0")
function pi:get-problem-html($id){ 
  let $problem-info := collection("problem")/problem
  return 
<html>
  <head>
    <title>Resultados de la Busqueda</title>
    <meta http-equiv="Refresh" content="url=list-problem"></meta>
      <meta http-equiv="Refresh" content="url=home"></meta>
      <meta http-equiv="Refresh" content="url=solution"></meta>
	  <script type = "text/javascript" src="/static/problem/js/funciones.js"></script>
	  <script type = "text/javascript" src="/static/problem/js/busqueda.js"></script>
	  <link href="/static/problem/css/styles.css" rel="stylesheet" type="text/css"></link>   
  </head>
  <body>
 <header><h1>Busqueda de Problemas</h1>
      <form name = "formLogin" method = "GET" action = "">
        <div>
          <input class = "LoginField" type = "text" name = "txtUser" placeholder = "Usuario"></input>
          <input class = "LoginField" type = "password" name = "txtPw" placeholder = "Contraseña"></input>
        </div>
        <div>
          <button class = "btnToggle" type = "button" onclick = "">Ingresa</button>
          <button class = "btnToggle" type = "button" onclick = "">Registrate</button>
        </div>
      </form></header>
    <nav>
      <div><a href="list-problem">Ver todos los problemas</a></div>
      <div><a href="home">Ir al home</a></div>
      <form name ="formFinder" method = "GET">
        <select name = "SelectOptionForSearch">
          <option value = "H1" selected = "selected">buscar problemas</option>
          <option value = "H2">buscar soluciones</option>
        </select>      
        <div name = "divNotify" style = "display: none;"></div>
        <input type = "text" name = "searchTxt" placeholder = "Busca por el nombre"></input>
        <button class = "btnToggle" type = "button" onclick = "searchIt()">search</button>
      </form>
    </nav>
    <div>{string("Resultados de la busqueda para: ")}<b>{string($id)}</b></div>
    <arcticle>
       {
          let $result := for $it1 in $problem-info where $it1 contains text {$id} any
           
             let $solution-info := $it1/solution
             let $cats := $it1/category
             let $id := $it1/id
             let $reviews := $it1/review
             return <div id ="{$id}" class = "Problem" onHover ="" onClick = "">
                                               <br></br>
                                               <h3>{string("Problema compartido por: ")}<b>{$it1/user/text()}</b></h3>
                                               <div class = "Title"><b>{$it1/title/text()}</b></div>
                                               <div class = "Description">{$it1/description/text()}</div>
                                               <div class = "Ranking">{string("Puntuacion: ")}
                                                 <b>{avg($it1/review/ranking/text())}</b>
                                               </div>
                                                {         
                                                   for $it in $cats
                                                       return <div class = "Category">{$it/text()}</div>
                                                }                                                          
                                               <div class = "Reviews" id = "{concat('reviews',$id)}">
                                                 <br></br>
                                                 <h2>{string("Comentarios: ")}</h2>
                                                 {        
                                                   for $it in $reviews
                                                     return <div class = "Review">
                                                               <div class = "User-Review"><b>
                                                                 {$it/user/text()}</b>{string(" dijo:")}
                                                               </div>
                                                               <div class = "Comment-Review">{$it/comment/text()}</div>
                                                               <div class = "Ranking">{string("Le dio una puntuacion de: ")}
                                                                 <b>{$it/ranking/text()}</b>
                                                               </div>
                                                             </div>
                                                  }
                                               </div>
                                               <br></br>
                                               <h2>Solucion</h2>
                                                 { 
                                                  for $solution in $solution-info
                                                    let $sol-reviews := $solution/review
                                                    return <div class = "Solution">
                                                             <div class = "Author">
                                                                <b>{$solution/user/text()}</b>{string(" compartio esta solucion: ")}
                                                             </div>
                                                             <div class = "Title"><b>{$solution/title/text()}</b></div>
                                                             <div class = "Description">{$solution/description/text()}</div>
                                                             <div class = "Ranking">
                                                                {string("Puntuacion: ")}<b>{avg($solution/review/ranking/text())}</b>
                                                             </div>
                                                               {
                                                                 for $it in $sol-reviews
                                                                   return <div class = "Review">
                                                                             <div class = "User-Review">
                                                                                <b>{$it/user/text()}</b>{string(" dijo:")}
                                                                             </div>
                                                                             <div class = "Comment-Review">{$it/comment/text()}</div>
                                                                             <div class = "Ranking">
                                                                               {string("Le dio una puntuacion de: ")}<b>{$it/ranking/text()}</b>
                                                                             </div>
                                                                         </div>
                                                               }
                                                             </div>
                   
                                                  }                                              
                                             </div>       
                    
      for $it1 in $result
               return $it1  
       }
    </arcticle>
  </body>
</html>
  
};

declare %rest:path("problem/search/{$id}")
%rest:GET
%output:method("json")
%output:json("format=jsonml")
%rest:produces("text/json")
function pi:get-problem-json($id){
  let $problem := collection("problem")/problem
  return
      <json type='object'>
        {let $result := for $it1 in $problem where $it1 contains text {$id} any
          return $it1
        for $it1 in $result
               return $it1}
      </json>
};

declare %rest:path("problem/search/{$id}")
%rest:GET
%rest:produces("text/xml", "application/xml")
%output:method("xml")
function pi:get-problem-xml($id){
  let $problem := collection("problem")/problem
  return <xml type = 'object'>{let $result := for $it1 in $problem where $it1 contains text {$id} any
          return $it1
        for $it1 in $result
               return $it1}</xml>
};

