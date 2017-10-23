# Backup a specific folder with bup - fup :-)
#
# Usage: fup.sh afolder another/folder /a/fully/qualified/folder ...
#
# set bname to have a different backup name than the basename of the parm

bupdir=`pwd`/.bup

#echo $#
#echo  "$# > 1"
#echo  "[ $# > 1 ]"
#echo  "$[ $# > 1 ]"
#echo  "(( $# > 1 ))"
#echo  "$(( $# > 1 ))"

for d in $@; do {  

  if [ ${bname}xx == xx ]
  then
    bname=`basename $d`
    #echo $d
  else
    if (( $# > 1 ))
    then
      echo bname is used only when a single folder is being bupped
      exit
    fi
    # echo $bname-$d-$#
  fi

  echo
  echo "Backing up (`dirname $d`) `basename $d` to $bname"
  echo

  # bup bug: --strip and --strip-path fail to save anything if stripping whole prefix
  # So graft the bname on again :-/

  cname=`readlink -f $d`

  sudo bup -d $bupdir index $cname
  #sudo bup -d $bupdir save -n $bname --strip-path $d $d/
  sudo bup -d $bupdir save -n $bname --graft $cname=/$bname $cname

} done

exit








  echo
  echo Backing up $d with bup...
  echo
  sudo bup -d $bupdir index /$d
  sudo bup -d $bupdir save -n `hostname -s`-$d /$d

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
