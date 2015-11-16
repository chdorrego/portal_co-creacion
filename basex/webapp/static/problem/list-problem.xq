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
	  <script type = "text/javascript">
		<![CDATA[/**/
			function verOcultar(id, buttonId){
				var reviews = document.getElementById(id);
				var texto = document.getElementById(buttonId).value;
				if(reviews.style.display == "none"){
					document.getElementById(id).style.display = "block";
					if(texto === "Ver comentarios"){
						document.getElementById(buttonId).value = "Ocultar comentarios";
					}else if(texto === "Ver solucion"){
						document.getElementById(buttonId).value = "Ocultar solucion";
					}
				}else{
					document.getElementById(id).style.display = "none";
					if(texto === "Ocultar comentarios"){
						document.getElementById(buttonId).value = "Ver comentarios";
					}else if(texto === "Ocultar solucion"){
						document.getElementById(buttonId).value = "Ver solucion";
					}
				}
			}
			
			function searchIt(){
				var combo = document.getElementsByName('SelectOptionForSearch')[0];
				var text = document.getElementsByName('searchTxt')[0].value;
				var url = 'search/';
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
		<table>
		<tr>
		<td class= "a1">
      <nav>
        <div><a href="home">Ir al home</a></div>
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
	    </td>
	  </tr>
	  </table>
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
