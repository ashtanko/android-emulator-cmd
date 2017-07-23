#! /usr/bin/env bash

detect_adb() {
	if which adb >/dev/null; then
		echo "adb detected in $(which adb)"
	else
		echo "warning: adb not installed"
		exit 1
	fi
}

detect_emulator() {
	if which emulator >/dev/null; then
		echo "emulator detected in $(which emulator)"
	else
		echo "warning: emulator not installed"
		exit 1
	fi
}

detect_adb
detect_emulator