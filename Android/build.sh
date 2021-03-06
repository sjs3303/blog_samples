#!/bin/bash

#
# Buildscript to build all Android samples using gradle build system.
# by 2014 Taeho Kim <jyte82@gmail.com>
#

# Specify Projects to build
projects=(
	2013-05-22_Android_Studio_First_Project/HelloWorld
	2013-07-21_Navigation_Drawer_Example/NavigationDrawerExample_Studio
	2013-11-18_AndroidStudio_Libproject/AndroidStudioLibApp
	2014-04-07_AndroidStudio_Testing/StudioTesting
	2014-04-18_Travis_Android_Gradle/TravisAndroid
	)

function build_subprojects(){

	for i in "${projects[@]}"
	do
		:
		echo
		echo [+] Building project $i ...
		echo
		# Move to subproject path
		cd $i
		# Invoke build command
		./gradlew build

		if [ $? -ne 0 ]; then
			echo 
			echo [-] Failed to build project.
			echo
			exit -1
		fi
		cd $ROOT_DIR
	done
}

ROOT_DIR=$(pwd)

build_subprojects

