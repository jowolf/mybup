My bup helper scripts - JJW

init.sh - initialize a new backup drive with a bup/ dir and a .bup/ repo inside it

bup.sh - backup this computer, meant to be run from the bup/ dir on the backup drive

fup.sh - folder backup, meant to be run from the dir containing the .bup/ repo, can be a backup drive or home folder
Uses sensible defaults, adds a bname if present

web.sh - launches mini-web server on 8080, prints URL and PID for surf / kill respectively

fus.sh - launches fuse fs on /media/bup, handy for file dates/times & metadata - killall bup-fuse


5/27/18 enhance for Mac folders, added hus, web, add mult folders to index & save for better naming, etc

2/19/18 excluded /var/lib/lxcfs, added make-softlinks.sh

11/25/17 added exclude-from, Mac folders

10/22/17 JJW initial release - My bup helper scripts
