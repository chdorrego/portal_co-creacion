module namespace email = 'http://basex.org/modules/email/EMail';

(: Enviar mensaje a todos los usuarios :)
declare %rest:path("/messages") 
%rest:GET 
%rest:produces("text/html" )
%output:method("html")
function email:enviar-mensajes(){
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
  return email:send($html)
};