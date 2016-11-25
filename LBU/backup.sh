#!/bin/bash
# Lazy Backup
#
E_BADARGS=85
E_NOTEMPTY=45
E_NOTDIR=34
E_XCD=54

function usage ()
{
  echo "Usage:"
  echo -e "  $(basename $0) \n\
  [-c|--config] dir1 dir2 \n\
  [-v|--version]"
}

function backup ()
{
  # Try to read lpu.conf and locate folder
  . lbu.conf
  dir="$(cat backDir.conf)"
  [  -e $BACKUP_DIR ] || echo "backup_dir is not set in lbu.conf"; exit $E_NOTDIR
  cd $BACKUP_DIR || {
    echo "Can't change to $BACKUP_DIR" >&2
    exit $E_XCD;
  }
  #Read last back up time
  . ./.lbu
  #List the files that were modify since this time
  for d in "$dir"
  do
    files+=$(find $d -newermt $LAST_BACKUP)
  done
  echo "$files"
  #Add them to the archive

  #Change the time of the last backup

  # Tcheck for usbkey or remote server

}

function init ()
{
  cp hiddenFile.sh $1/.lbu
}

[ $# -eq 0 ] && \
{ 
  usage
   exit $E_BADARGS
}
while (( $# > 0 )); do
  case $1 in
    -d|--addir)
            #Call pbu_config.sh to add dirs
            echo "Config option"
            shift
            . pbu_config.sh $@
    ;;
    -l|--local)
            #Set the local folder to backup, must be empty
            [ -d $2 ] || \
            { echo "Folder dont exist"; exit $E_NOTEMPTY; }
            echo $(ls $2 | wc -l)
	    [ $(ls -lA $2 | wc -l) -eq 1 ] || { echo "-l|--local my be follow by an empty dir"; exit $E_NOTDIR; }
	    echo "Folder : $2 is valid"
            echo "BACKUP_DIR=$2" > lbu.conf
            init $2
    ;;
    -b|--backup) #default option
	    echo "BU"
    ;;
    *)
	    echo "$1"
    ;;
  esac
  shift
done

exit 0


