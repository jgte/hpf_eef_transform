#!/bin/bash

APPDIR=/hpf_eef_transform
IODIR=/iodir

case "$1" in
  sh) #run the shell instead of an app
    exec /bin/bash -i
  ;;
  modes) #shows all available modes
    grep ') #' $BASH_SOURCE \
      | grep -v grep \
      | grep -v sed \
      | sed 's_) #_ : _g'
  ;;
  test) #call the check_eef_transform.sh script to test the data extraction
    exec $APPDIR/check_eef_transform.sh
  ;;
  extract) #extract a file, arguments after 'extract' are passed to hpf_eef_transform.pl
    exec $APPDIR/hpf_eef_transform.pl --output=$IODIR --verbose ${@:2}
  ;;
  help) #show the help string
    echo "\
Possible arguments:
- modes [arguments]

mode is one of:
$($BASH_SOURCE modes)

Any sequence of commands that does not start with one of the modes is passed transparently to the container.
"
  ;;
  *) #transparently pass all other arguments to the container
    exec $@
  ;;
esac