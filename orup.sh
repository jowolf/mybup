# Set env to this backup drive, and back up the remote host, generate redundancy

bupdir=`pwd`/.bup
hostname=$1

echo backing up remote host $1 with ON into $bupdir

if echo $OSTYPE | grep darwin; then {   # Could also use uname here

  dirs='/etc /home /opt /root /var /usr/local /Users /private'

} elif echo $OSTYPE | grep linux; then {

  dirs='/etc /home /opt /root /var /usr/local'

} else {
  echo Unknown platform - $OSTYPE
  exit
} fi

echo
echo Backing up $hostname $dirs with bup...
echo
sudo bup -d $bupdir on $1 index $dirs --exclude-from exclude-from.txt
sudo bup -d $bupdir on $1 save -n $hostname $dirs

echo 'bup index & save done, adding redundancy'

if sudo bup -d $bupdir fsck --par2-ok; then {
  echo "par2 is ok, doing bup fsck"
  sudo bup -d $bupdir fsck -gv --quick
} else {
  echo "par2 is NOT INSTALLED - no redundancy will be added"
} fi

echo bup done.

