My bup helper scripts - JJW 10/22/17

init.sh - initialize a new backup drive with a bup/ dir and a .bup/ repo inside it

bup.sh - backup this computer, meant to be run from the bup/ dir on the backup drive

fup.sh - folder backup, meant to be run from the dir containing the .bup/ repo, can be a backup drive or home folder
Uses sensible defaults, adds a bname if present

11/25/17 added exclude-from, Mac folders

2/19/18 excluded /var/lib/lxcfs, added make-softlinks.sh

