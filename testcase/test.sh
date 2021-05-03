#!/bin/bash

# ----------------------------------------------------------------------------
# User setting
# ----------------------------------------------------------------------------

PROJECT_DIR=".."

# ----------------------------------------------------------------------------
# Script setting
# ----------------------------------------------------------------------------

EX00="${PROJECT_DIR}/ex00/hello-world.go"
EX01="${PROJECT_DIR}/ex01/vars.go"
EX02="${PROJECT_DIR}/ex02/isEmailAddress.go"
EX03="${PROJECT_DIR}/ex03/createStairs.go"
EX04="${PROJECT_DIR}/ex04/calculation.go"
EX05="${PROJECT_DIR}/ex05/subSlice.go"
EX06="${PROJECT_DIR}/ex06/echo42.go"
EX04_MAIN="${PROJECT_DIR}/ex04/main04.go"
EX05_MAIN="${PROJECT_DIR}/ex05/main05.go"

# color
RESET="\e[0m"
GREEN="\e[32m"
RED="\e[31m"
BOLD="\e[1m"
UNDERLINED="\e[4m"

# ----------------------------------------------------------------------------
# fmt check
# ----------------------------------------------------------------------------
# gofmt -d ../**/*.go

# ----------------------------------------------------------------------------
# main
# ----------------------------------------------------------------------------

test_init () {
	printf "\n[${EX_COLOR}$1${RESET}]\n"
	gofmt -d $2
	go build -o output $2 $3

}

print_case () {
	printf "${UNDERLINED}$@${RESET}\n"
}

print_result () {
	if [ $1 -eq 0 ]; then
		printf "${GREEN}OK${RESET}\n"
	else
		printf "${RED}KO${RESET}\n"
	fi
}

test_do () {
	print_case "${@:2}"
	./output "${@:2}" | cat -e >> actual/$1.txt
}

test_do2 () {
	print_case "${@:2}"
	./output "${@:2}" 2>> actual/$1.txt
}

test_diff () {
	diff expected/$1.txt actual/$1.txt
	print_result $?
}

test_ex00 () {
	test_init ex00 ${EX00}
	test_do ex00
	test_diff ex00
}

test_ex01 () {
	test_init ex01 ${EX01}
	test_do ex01
	test_diff ex01
}

test_ex02 () {
	test_init ex02 ${EX02}

	test_do ex02
	test_do ex02 test.test@gmail.com
	test_do ex02 a
	test_do ex02 descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdes@gmail.com
	test_do ex02 descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdess@gmail.com
	test_do ex02 descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptodrsdess@gmail.com
	test_do ex02 descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescripstoaaa
	test_do ex02 descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescripstoaaada

	test_diff ex02
}

test_ex03 () {
	test_init ex03 ${EX03}

	test_do ex03 1
	test_do ex03 3
	test_do ex03 4
	test_do ex03 0
	test_do ex03 10
	test_do ex03 12

	test_diff ex03
}

test_ex04 () {
	cp ./main04.go ${PROJECT_DIR}/ex04
	test_init ex04 ${EX04} ${EX04_MAIN}

	test_do ex04 12 4
	test_do ex04 a 4
	test_do ex04 4
	test_do ex04 4 3 3
	test_do ex04
	test_do ex04 0 0
	test_do ex04 0 10

	test_diff ex04
	rm ${EX04_MAIN}
}

test_ex05 () {
	cp ./main05.go ${PROJECT_DIR}/ex05
	test_init ex05 ${EX05} ${EX05_MAIN}

	test_do ex05

	test_diff ex05
	rm ${EX05_MAIN}
}

test_ex06 () {
	test_init ex06 ${EX06}
	test_do ex06 12 34 555
	test_do ex06 -s / a bc def
	test_do ex06 -s XXXXXXX 12 34 56789
	test_do2 ex06 -help
	test_diff ex06

	echo -n 12 34 555 | cat -e > ans
	./output -n 12 34 555 | cat -e > myout
	diff ans myout

	echo | cat -e > ans
	./output | cat -e > myout
	diff ans myout

	echo -n | cat -e > ans
	./output -n | cat -e > myout
	diff ans myout
}

test_main () {
	if [ $# -eq 0 ]; then
		test_ex00
		test_ex01
		test_ex02
		test_ex03
		test_ex04
		test_ex05
		test_ex06
		return
	fi
	for ex in $@;
	do
		case $ex in
			ex00) test_ex00
				;;
			ex01) test_ex01
				;;
			ex02) test_ex02
				;;
			ex03) test_ex03
				;;
			ex04) test_ex04
				;;
			ex05) test_ex05
				;;
			ex06) test_ex06
				;;
			* ) echo "Usage $0 [ex00..06]"
				;;
		esac
	done
}

mkdir -p actual
rm -f actual/*.txt ./output
test_main $@
rm -rf myout ans output
