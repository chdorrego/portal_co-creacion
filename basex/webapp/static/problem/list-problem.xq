module namespace pi = 'http://udem.edu.co/mins';
declare %rest:path('list-problem')
%rest:GET
%rest:PUT
%rest:produces("text/html")
%output:method("html")
%output:version("5.0")
function pi:get-list-problem-html(){   
  let $problem-info := collection("problem")/problem
  return
  <html>
    <head>
      <title>Lista de Problemas</title>
      <meta http-equiv="Refresh" content="url=home"></meta>
      <meta http-equiv="Refresh" content="url=problem"></meta>
      <meta http-equiv="Refresh" content="url=solution"></meta>
	  <script type = "text/javascript" src="/static/problem/js/funciones.js"></script>
	  <script type = "text/javascript" src="/static/problem/js/busqueda.js"></script>
	  <link href="/static/problem/css/styles.css" rel="stylesheet" type="text/css"></link>
    </head>
    <body>  
    <header><h1>Lista de Todos los Problemas</h1>
        <form name = "formLogin" method = "GET" action = "">
          <div>
            <input class = "LoginField" type = "text" name = "txtUser" placeholder = "Usuario"></input>
            <input class = "LoginField" type = "password" name = "txtPw" placeholder = "Contraseña"></input>
          </div>
          <div>
            <button  class = "btnToggle" type = "button" onclick = "">Ingresa</button>
            <button  class = "btnToggle" type = "button" onclick = "">Registrate</button>
          </div>
        </form></header>
      <nav>
        <div><a href="?run=home.xq">Ir al home</a></div>
        <form name ="formFinder" method = "GET">
          <select name = "SelectOptionForSearch">
            <option value = "H1" seleced = "selected">buscar problemas</option>
            <option value = "H2">buscar soluciones</option>
          </select>     
          <div name = "divNotify" style = "display: none;"></div>
          <input type = "text" name = "searchTxt" placeholder = "Busca por el nombre"></input>
          <button class = "btnToggle" type = "button" onclick = "searchIt()">search</button>
        </form>
      </nav>
      <article>
    {
      
      for $iterator in $problem-info   
         order by $iterator/title 
         let $reviews := $iterator/review
         let $cats := $iterator/category
         let $solution := $iterator/solution
         let $sol-reviews := $solution/review
         let $id := $iterator/id/text()
         return <div id ="{$id}" class = "Problem" onHover ="" onClick = "">
                   <br></br>
                   {string("Problema compartido por: ")}<b>{$iterator/user/text()}</b>
             <input type = "button" class = "btnToggle" id = "{concat('verReviews', $id)}" value = "Ver comentarios" onClick = "verOcultar('{concat('reviews',$id)}', '{concat('verReviews', $id)}')"/>
             <input type = "button" class = "btnToggle" value = "Ver solucion" id = "{concat('verSolucion', $id)}" onCLick = "verOcultar('{concat('solucion', $id)}', '{concat('verSolucion', $id)}')"/>
             <div class = "Title" ><b>{$iterator/title/text()}</b></div>
             <div class = "Description">{$iterator/description/text()}</div>           
             {         
               for $it in $cats
                 return <div class = "Category">{$it/text()}</div>
             }
             <div class = "Ranking">{string("Puntuacion: ")}<b>{avg($iterator/review/ranking/text())}</b></div>           
             <div class = "Reviews" id = "{concat('reviews',$id)}" style = "display: none;">{string("Comentarios: ")}
             {        
               for $it in $reviews
                 return <div class = "Review">
                     <div class = "User-Review"><b>{$it/user/text()}</b>{string(" dijo:")}</div>
                     <div class = "Comment-Review">{$it/comment/text()}</div>
                     <div class = "Ranking">{string("Le dio una puntuacion de: ")}<b>{$it/ranking/text()}</b></div>
                   </div>
             }</div>           
             <div class = "Solution" id = "{concat('solucion',$id)}" style = "display: none;">{string("Solucion ")}
               <div class = "Author"><b>{$solution/user/text()}</b>{string(" compartio esta solucion: ")}</div>
               <div class = "Title"><b>{$solution/title/text()}</b></div>
               <div class = "Description">{$solution/description/text()}</div>
               <div class = "Ranking">{string("Puntuacion: ")}<b>{avg($solution/review/ranking/text())}</b></div>
               {
                 for $it in $sol-reviews
                   return <div class = "Review">
                       <div class = "User-Review"><b>{$it/user/text()}</b>{string(" dijo:")}</div>
                       <div class = "Comment-Review">{$it/comment/text()}</div>
                       <div class = "Ranking">{string("Le dio una puntuacion de: ")}<b>{$it/ranking/text()}</b></div>
                     </div>
               }</div>
               
           </div>       
    }
      </article>
    </body>
  </html>
};

declare %rest:path("list-problem")
%rest:GET
%output:method("json")
%output:json("format=jsonml")
%rest:produces("text/json")
function pi:get-list-problem-json(){
  let $problem := collection("problem")/problem
  return
      <json type='object'>
        {$problem/*}
      </json>
};


declare %rest:path("list-problem")
%rest:GET
%rest:produces("text/xml", "application/xml")
%output:method("xml")
function pi:get-list-problem-xml(){
  let $problem := collection("problem")/problem
  return <xml type='object'>{
  for $it at $pos in $problem
    return $it
  }</xml>

};
