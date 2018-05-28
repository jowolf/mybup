# bup -d .bup web --browser

bup -d .bup web &

echo PID $!
echo Now surf to: http://127.0.0.1:8080/?hidden=1
echo when done:  kill $!
