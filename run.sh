#! /usr/bin/env bash

AVDS=()
AVDS_ARRAY=()
AVD_NUMBER=$1

echo "** detecting enviroment **"
echo ""
sh detector.sh
echo ""

list_avds() {
	echo "list of avds"
	echo ""
	emulator -list-avds
	AVDS=$(emulator -list-avds)
	echo ""
}

check_avd() {
	for avd in $AVDS; do
		AVDS_ARRAY+=("$avd")
		let "counter = $counter + 1"
		echo "select number of avd: ($counter) $avd"
	done
}

do_choose() {
	if [ ! $AVD_NUMBER ]; then
		read -r number
		AVD_NUMBER=$number
	else
		echo "avd number is $AVD_NUMBER"
	fi
}

check_choose_number() {
	if [ $AVD_NUMBER ]; then
		echo "AVD_NUMBER: $AVD_NUMBER $counter"
		if (( $AVD_NUMBER > $counter )); then
			echo "please select another number"
			read -r number
			AVD_NUMBER=$number
			#recurcive call
			check_choose_number
		else
			echo "you choose is: ${AVDS_ARRAY[$AVD_NUMBER-1]}"
			run ${AVDS_ARRAY[$AVD_NUMBER-1]} $AVD_NUMBER
		fi
	fi
}

run() {
	echo "run: $1 $2"
	cd $EMULATOR_HOME
	./emulator @$1 -gpu on -no-boot-anim
}

run_all() {
	
}

list_avds
check_avd
do_choose
check_choose_number

