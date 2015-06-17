#!/bin/bash
#===============================================================================
#
#          FILE:  tool_box.sh
#
#         USAGE:  ./tool_box.sh
#
#   DESCRIPTION:  To create filename with timestamp release version number and header.
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Ovidiu Tatar (Mn), ovn.tatar@gmail.com
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  10/12/2012 09:39:45 AM CEST
#      REVISION:  ---
#===============================================================================

#set -x # for DEBUGING

do_help() {
   echo "Options include:"
   echo "<VERSION>"
   echo "               0 for alpha (status)"
   echo "               1 for beta (status)"
   echo "               2 for release candidate"
   echo "               3 for (final) release"
   echo "<FILE>"
   echo "		exp. test.pl|test.sh|test.py|test.php|test.sh|test.rb"
	
}


USAGE="$0 <VERSION> <FILE>"



if [ "$#" -ne 2 ] ; then
   echo "$USAGE"
   echo "$HELP"
   do_help
   exit 1
fi

file_type=$(echo $2 | cut -f2 -d".")

echo "----------- directory include --------------"
ls --color | grep $file_type
echo "--------------------------------------------"
echo ""

touch_file()
{
   file_name=$(echo $2 | cut -f1 -d".")
   file_type=$(echo $2 | cut -f2 -d".")
   end_file="$file_name-`date +%Y_%m_%d`_$1.$file_type"
   if [ -e $end_file ];then
      echo "File $end_file already exist!"
      touch_file_with_patch $end_file
   else
      echo "Create $end_file file!"
      touch $end_file
      create_header $file_type $end_file
   fi
}
touch_file_with_patch()
{
   file_type=$(echo $1 | cut -f2 -d".")
   new_count=$(echo $1 | cut -f4 -d"_" | sed -e s"/.$file_type//g")-1
   first_part=$(echo $1 | cut -f1,2,3 -d"_")
   new_file=""$first_part"_"$new_count"."$file_type""
   if [ -e $new_file ];then
      echo "Next version $new_file exist to!"
      touch_file_with_patch_plus $new_file
   else
      echo "Create $new_file file with patch level 1!"
      touch $new_file
      create_header $file_type $new_file
   fi
}

touch_file_with_patch_plus()
{
   file_type=$(echo $1 | cut -f2 -d".")
   new_count_plus=$(echo $1 | cut -f3 -d"-" | sed -e s"/.$file_type//g")
   new_count_plus=$(( $new_count_plus + 1 ))
   first_part=$(echo $1 | cut -f1,2 -d"-")
   new_file=""$first_part"-"$new_count_plus"."$file_type""
   if [ -e $new_file ];then
      echo "Higher version $new_file exist to!"
      touch_file_with_patch_plus $new_file
   else
      echo "Create $new_file file with patch level $new_count_plus!"
      touch $new_file
      create_header $file_type $new_file
   fi
}

create_header()
{

   if [ "$1" == "pl" ];then
      echo "#!/usr/bin/perl" > $2
      echo "#===============================================================================" >> $2
      echo "#" >> $2
      echo "#          FILE:  $2" >> $2
      echo "#" >> $2
      echo "#         USAGE:  ./$2" >> $2
      echo "#" >> $2
      echo "#   DESCRIPTION:" >> $2
      echo "#" >> $2
      echo "#       OPTIONS:  ---" >> $2
      echo "#  REQUIREMENTS:  ---" >> $2
      echo "#          BUGS:  ---" >> $2
      echo "#         NOTES:  ---" >> $2
      echo "#        AUTHOR:  <USERNAME> <MAIL>" >> $2
      echo "#       COMPANY:  " >> $2
      echo "#       VERSION:  $2" >> $2
      echo "#       CREATED:  $(date)" >> $2
      echo "#      REVISION:  ---" >> $2
      echo "#===============================================================================" >> $2
      echo "use warnings;" >> $2
      echo "use strict;" >> $2
      echo "" >> $2
   fi
   
   if [ "$1" == "py" ];then
      echo "#!/usr/bin/python" > $2
      echo "#===============================================================================" >> $2
      echo "#" >> $2
      echo "#          FILE:  $2" >> $2
      echo "#" >> $2
      echo "#         USAGE:  ./$2" >> $2
      echo "#" >> $2
      echo "#   DESCRIPTION:" >> $2
      echo "#" >> $2
      echo "#       OPTIONS:  ---" >> $2
      echo "#  REQUIREMENTS:  ---" >> $2
      echo "#          BUGS:  ---" >> $2
      echo "#         NOTES:  ---" >> $2
      echo "#        AUTHOR:  <USERNAME> <MAIL>" >> $2
      echo "#       COMPANY:  " >> $2
      echo "#       VERSION:  $2" >> $2
      echo "#       CREATED:  $(date)" >> $2
      echo "#      REVISION:  ---" >> $2
      echo "#===============================================================================" >> $2
      echo "" >> $2
   fi
   
   if [ "$1" == "sh" ];then
      echo "#!/bin/bash" > $2
      echo "#===============================================================================" >> $2
      echo "#" >> $2
      echo "#          FILE:  $2" >> $2
      echo "#" >> $2
      echo "#         USAGE:  ./$2" >> $2
      echo "#" >> $2
      echo "#   DESCRIPTION:" >> $2
      echo "#" >> $2
      echo "#       OPTIONS:  ---" >> $2
      echo "#  REQUIREMENTS:  ---" >> $2
      echo "#          BUGS:  ---" >> $2
      echo "#         NOTES:  ---" >> $2
      echo "#        AUTHOR:  <USERNAME> <MAIL>" >> $2
      echo "#       COMPANY:  " >> $2
      echo "#       VERSION:  $2" >> $2
      echo "#       CREATED:  $(date)" >> $2
      echo "#      REVISION:  ---" >> $2
      echo "#===============================================================================" >> $2
      echo "" >> $2
   fi
   
   if [ "$1" == "php" ];then
      
      echo "<?php" >> $2
      echo "/** ">> $2
      echo " * File desctiption ">> $2
      echo " * ">> $2
      echo " * @author 	<USERNAME> <MAIL>" >> $2
      echo " * @version	$2 ">> $2
      echo " * @date	$(date)" >> $2
      echo " * " >> $2
      echo " * " >> $2
      echo " */" >> $2
      echo "" >> $2
   fi
   
   if [ "$1" == "rb" ];then
      echo "#!/usr/bin/ruby -w" >> $2
      echo "=begin" >> $2
      echo "/***************************************************************************" >> $2
      echo "*" >> $2
      echo "*          FILE:  $2" >> $2
      echo "*" >> $2
      echo "*         USAGE:  ./$2" >> $2
      echo "*" >> $2
      echo "*   DESCRIPTION:" >> $2
      echo "*" >> $2
      echo "*       OPTIONS:  ---" >> $2
      echo "*  REQUIREMENTS:  ---" >> $2
      echo "*          BUGS:  ---" >> $2
      echo "*         NOTES:  ---" >> $2
      echo "*        AUTHOR:  <USERNAME> <MAIL>" >> $2
      echo "*       COMPANY:  " >> $2
      echo "*       VERSION:  $3" >> $2
      echo "*       CREATED:  $(date)" >> $2
      echo "*      REVISION:  ---" >> $2
      echo "*  ***************************************************************************/" >> $2
      echo "=end">> $2
      echo "" >> $2
   fi
   
   
   
   
   
}

while [ $# -gt 0 ] ; do
   case "$1" in
      *)
         touch_file $1 $2
      ;;
   esac
   exit 0
done

