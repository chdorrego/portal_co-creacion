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
	  <script type = "text/javascript">
		<![CDATA[/**/		
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
					height: 350px;
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
					height: 350px;	
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
      <header><h1>HOME</h1>
        <form name = "formLogin" class = "loginForm" method = "GET" action = "">
          <div>
            <input class = "textField" type = "text" name = "txtUser" placeholder = "Usuario"></input>
            <input class = "textField" type = "password" name = "txtPw" placeholder = "Contraseña"></input>
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
        <div><a href="list-problem">Ver todos los problemas</a></div>
        <form name ="formFinder" method = "GET">
		<div>
			  <select name = "SelectOptionForSearch">
			  <option value = "default" selected = "selected"> selecciona algo</option> 
				<option value = "H1">buscar problemas</option>
				<option value = "H2">buscar soluciones</option>
			  </select> 
		</div>		
        <div name = "divNotify" style = "display: none;"></div>
		<div>
			<input type = "text" class = "textField" name = "searchTxt" placeholder = "Busca por el nombre"></input>
		 </div>
		 <div>
			<button class = "btnToggle" type = "button" onclick = "searchIt()">search</button>
		 </div>
        </form>
      </nav>
	  </td>
	  <td class="a2">	  
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
	  </td>
	  </tr>
	  </table>
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