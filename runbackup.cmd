Set host=localhost

curl -X POST https://%host%/Login^
 -d @payload/payload-login.json^
 --header "Content-Type: application/json; charset=UTF-8"^
 --header "X-Requested-With: XMLHttpRequest"^
 --header "_localSession: 0123456789"^
 --compressed^
 --cookie-jar session-cookie.txt

 curl -X POST https://%host%/PerformTask^
 -d @payload/payload-task.json^
 --header "Content-Type: application/json; charset=UTF-8"^
 --header "X-Requested-With: XMLHttpRequest"^
 --header "_localSession: 0123456789"^
 --compressed^
 --cookie session-cookie.txt