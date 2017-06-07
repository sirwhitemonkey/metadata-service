#!/bin/sh

echo " ███╗   ███╗ ██████╗ ██╗  ██╗██╗ ██████╗ ███╗   ██╗ "
echo " ████╗ ████║██╔═══██╗╚██╗██╔╝██║██╔═══██╗████╗  ██║ "
echo " ██╔████╔██║██║   ██║ ╚███╔╝ ██║██║   ██║██╔██╗ ██║ "
echo " ██║╚██╔╝██║██║   ██║ ██╔██╗ ██║██║   ██║██║╚██╗██║ "
echo " ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗██║╚██████╔╝██║ ╚████║ "

echo " MetaData Service << SpringBoot >>"

success=0

#checking code standard
echo "validating codebase {checkstyle}..."
mvn  checkstyle:check
status=$?
if [ $status -eq 1 ]; then
	success=1
fi
echo "validating codebase {pmd}..."
mvn pmd:check 
status=$?
if [ $status -eq 1 ]; then
   	success=1
fi
mvn clean test -Dmaven.test.skip=true
status=$?
if [ $status -eq 0 ] && [ $success -eq 0 ]; then
	mvn clean install -U -Dmaven.test.skip=true
fi
echo "		code base:$source done ..  "

if [ $success -eq 0 ]; then

	cp  target/metadata-service.jar  docker/moxion
 	echo "---------------------------------------------------"
	echo "<MetaData-Service>  compiled successful ..."
	echo "---------------------------------------------------"
	
else
	echo "****************** ERROR {MetaData failed} ******************"
fi

