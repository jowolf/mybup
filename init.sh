# Do NOT run this more than once!
#
# Run this from root of plugged-in USB backup drive:
#
# eg mybup/init.sh

if ! which bup; then {
  echo bup not installed!
  exit
} fi

  
if test -e bup; then {
  echo ALREADY DONE
  exit
} fi


mkdir -p bup
cd bup

read -p "This will initialize and DESTROY any existing bup data - Proceed? [y/N]" yn

if test $yn != 'y'; then {
  echo NOT proceeding
  exit
} fi


sudo bup -d `pwd`/.bup init

../mybup/make-softlinks.sh

echo Done
