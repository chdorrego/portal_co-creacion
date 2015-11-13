module namespace pi = 'http://udem.edu.co/mins';
declare %rest:path('home')
%rest:GET
%rest:produces("text/html")
%output:method("html")
%output:version("5.0")
function pi:get-home-html(){  
  let $problem-info := collection("problem")/problem
  return
  <html>
    <head>
      <title>HOME</title>
      <meta http-equiv="Refresh" content="url=list-problem"></meta>
      <meta http-equiv="Refresh" content="url=problem"></meta>
      <meta http-equiv="Refresh" content="url=solution"></meta>
	  <script type = "text/javascript" src="/static/problemjs/funciones.js"></script>
	  <script type = "text/javascript" src="/static/problem/js/busqueda.js"></script>
	  <link href="/static/problemcss/styles.css" rel="stylesheet" type="text/css"></link>
    </head>
    <body>
      <header><h1>HOME</h1>
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
        <div><a href="?run=listar-problemas.xq">Ver todos los problemas</a></div>
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
        let $result := for $better in $problem-info
                          let $ranking := avg($better/review/ranking/text())
                          order by $ranking descending
                          return $better  
        for $x at $pos in $result where $pos <= 3
          return <div class = "Problem" onclick = "showProblem('{$x/title/text()}')"><br></br>
                   {string("Problema compartido por: ")}<b>{$x/user/text()}</b>                 
                   <div class = "Title"><b>{$x/title/text()}</b></div>
                   <div class = "Description">{$x/description/text()}</div>
                   <div class = "Ranking">{string("Puntuacion: ")}<b>{avg($x/review/ranking/text())}</b></div>
                 </div>
      }
      </article>
    </body>
  </html>
};

declare %rest:path("home")
%rest:GET
%output:method("json")
%output:json("format=jsonml")
%rest:produces("text/json")
function pi:get-home-json(){
  let $problem-info := collection("problem")/problem
  let $result := for $better in $problem-info
                          let $ranking := avg($better/review/ranking/text())
                          order by $ranking descending
                          return $better  
  return
      <json type='object'>
        {for $x at $pos in $result where $pos <= 3
          return $x}
      </json>
};

declare %rest:path("home")
%rest:GET
%rest:produces("text/xml", "application/xml")
%output:method("xml")
function pi:get-home-xml(){
  let $problem-info := collection("problem")/problem
  return <xml type='object'>{
     let $result := for $better in $problem-info
                          let $ranking := avg($better/review/ranking/text())
                          order by $ranking descending
                          return $better  
     for $x at $pos in $result where $pos <= 3
          return $x
  }</xml>
};