module namespace pi = 'http://udem.edu.co/mins';
declare %rest:path('search/problem/{$id}')
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
	  <script type = "text/javascript">
		<![CDATA[/**/		
		function searchIt(){
				var combo = document.getElementsByName('SelectOptionForSearch')[0];
				var text = document.getElementsByName('searchTxt')[0].value;
				var url = '/search/';
				if(combo.selectedIndex <= 0){
					document.getElementsByName('divNotify')[0].innerHTML = "por favor selecciona algo.";
					document.getElementsByName('divNotify')[0].style.display = 'block';
					return;
				}
				if(text == ''){
					document.getElementsByName('divNotify')[0].innerHTML = "por favor escribe algo.";
					document.getElementsByName('divNotify')[0].style.display = 'block';
					return;
				}
				if(combo.value == 'H1'){
					url += 'problem/';
				}
				if(combo.value == 'H2'){
					url += 'solution/';
				}
				url += text;
				window.location = url;
			}
		/*]]>*/
	  </script>  
		<style type="text/css">
			<!--/*--><css><![CDATA[/**/	
				table{
					width: 100%;
				}
				
				td.a1{
					width:180px;
					background: #1290FF;						
				}	
				td.a2{
					margin-left: 20px;
				}
				
				button{
					-moz-box-shadow:inset 0px 1px 0px 0px #91b8b3;
					-webkit-box-shadow:inset 0px 1px 0px 0px #91b8b3;
					box-shadow:inset 0px 1px 0px 0px #91b8b3;
					background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #768d87), color-stop(1, #6c7c7c));
					background:-moz-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
					background:-webkit-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
					background:-o-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
					background:-ms-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
					background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
					filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#768d87', endColorstr='#6c7c7c',GradientType=0);
					background-color:#768d87;
					border:1px solid #566963;
					display:inline-block;
					cursor:pointer;
					color:#ffffff;
					font-family:Arial;
					font-size:13px;
					font-weight:bold;
					padding:6px 12px;
					text-decoration:none;					
					margin-bottom:10px;
					width: 100px;
				}

				button:hover {
					background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #6c7c7c), color-stop(1, #768d87));
					background:-moz-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
					background:-webkit-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
					background:-o-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
					background:-ms-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
					background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
					filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6c7c7c', endColorstr='#768d87',GradientType=0);
					background-color:#6c7c7c;
				}

				button:active {
					position:relative;
					top:1px;
				}
				
				body{
					background: #888888;					
				}
				
				header{
					background: #02DB6E;
					
				}
				nav{
					height: 100%;
					width: 100%;				
				}
				
				input[type="text"] {				  				  
				  font-family: sans-serif;
				  font-size: 14px;				
				}
				input[type="text"]:focus {
				  outline: none;
				}
				
				input[type="password"] {
					display: block;				  
					font-family: sans-serif;
					font-size: 14px;
				}
				
				article{
					height: 100%;	
					width: 100%;					
					background: #1290FF;	
					margin-right: 20px;
				}
				
				select {
					padding:3px;
					margin: 0;
					-webkit-border-radius:4px;					
					border-radius:4px;
					-webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;					
					box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
					background: #f8f8f8;
					color:#888;
					border:none;
					outline:none;
					display: inline-block;
					-webkit-appearance:none;
					-moz-appearance:none;
					cursor:pointer;	
					margin-bottom:10px;
					margin-top:10px;
				}		
				
			/*]]>*/<!--/*--></css><!--*/-->
	  </style>
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
	  <table>
		<tr>
		<td class= "a1">
    <nav>
      <div><a href="/list-problem">Ver todos los problemas</a></div>
      <div><a href="/home">Ir al home</a></div>
      <form name ="formFinder" method = "GET">
        <select name = "SelectOptionForSearch">
          <option value = "default" selected = "selected"> selecciona algo</option> 
          <option value = "H1" >buscar problemas</option>
          <option value = "H2">buscar soluciones</option>
        </select>      
        <div name = "divNotify" style = "display: none;"></div>
        <input type = "text" name = "searchTxt" placeholder = "Busca por el nombre"></input>
        <button class = "btnToggle" type = "button" onclick = "searchIt()">search</button>
      </form>
    </nav>
	</td>
	<td class="a2">
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
	  </td>
	  </tr>
	  </table>
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

