
(:User Services:)

xquery version '3.0';
module namespace page = "http://basex.org/examples/web-page";
import module namespace session = "http://basex.org/modules/session";

(:user register:)
declare
%rest:path("/register")
%rest:POST("{$new_user_data}")
%output:method("json")
%output:json("format=direct")
updating function page:register( $new_user_data)
{

  let $name_document := concat($new_user_data//user,".xml")
  return if(not(db:exists("account",$name_document)))
       then db:add("account",$new_user_data,$name_document)
       else ()
};

declare
%rest:path("/profile")
%rest:POST("{$user}")
%output:method("json")
%output:json("format=direct")
updating function page:updateuser($user)
{
  let $name_document := concat($user//user,".xml")
  return if(db:exists("account",$name_document))
       then db:replace('account',$name_document,$user)
       else ()

};

declare
%rest:path("/user")
%rest:GET
%rest:produces("text/xml","application/xml")
%output:method("xml")
function page:user()
{
  let $db := db:open('account')
  let $username := session:get('user')
  let $data := $db//account[user = $username/user]
  let $error := if(exists($data))then 0 else 1
  let $message := if(exists($data))then "User exist" else "User doesn't exist"
  return  $data
};

(:Session Services:)

declare
%rest:path("/login")
%rest:POST("{$userLog}")
%output:method("json")
%output:json("format=direct")
function page:login($userLog)
{

  let $db := db:open('account')
  let $user := $db//account[user = $userLog/account/user and password = $userLog/account/password]
  let $user_session := session:set('user', if((exists($user))and($user/enable/text() = "true"))then $user else 'inactive')
  let $error := if((exists($user))and($user/enable/text() = "true"))then 0 else 1
  let $message := if((exists($user))and($user/enable/text() = "true"))then "Welcome" else "User or password doesn't match" 
  return  <json type="object">
          <error>{$error}</error>
          <message>{$message}</message>
        </json>
};


declare
%rest:path("/logout")
%rest:GET
function page:logout()
{
  let $del := session:delete('user')
  let $close := session:close()
  return <rest:redirect>http://google.com.co</rest:redirect>
};

declare
function page:testsession()
{
let $current_session := session:get('user')
  
return if($current_session='inactive')
then <rest:redirect>http://google.com.co</rest:redirect> (:Go to login:)
else <nada>Staying here</nada>
         
};

(:Delete User:)

declare
%rest:path("/profile")
%rest:DELETE
updating function page:delete()
{
  let $current_session := session:get('user')
  let $current_session_delete := session:delete('user')
  let $db := db:open('account')
  let $user := $db//account[user = $current_session/user]
  return if(not(empty($user)))
       then replace value of node $db//account[user = $user/user/text()]/enable with 'false' 
       else (db:output("ni existe")) 
};
