# Set env to this backup drive, and back up the local host, generate redundancy

# nfg, doesn't pass throu to sudo:
#env BUP_DIR=`pwd`/.bup
#echo

# nfg, doesn't work either:
#sudo -E env
#sudo --preserve-env env
#exit

bupdir=`pwd`/.bup

for d in etc home opt root var usr/local Users private; do {  # home opt root var usr/local; do {

  echo
  echo Backing up $d with bup...
  echo
  sudo bup -d $bupdir $@ index /$d --exclude-from exclude-from.txt
  sudo bup -d $bupdir $@ save -n `hostname -s`-$d /$d

} done

echo 'bup index & save done, adding redundancy'

if sudo bup -d $bupdir fsck --par2-ok; then
  echo "par2 is ok, doing bup fsck"
  sudo bup -d $bupdir fsck -gv --quick
fi

if ! sudo bup -d $bupdir fsck --par2-ok; then
  echo "par2 is NOT INSTALLED - no redundancy will be added"
fi

echo bup done.

