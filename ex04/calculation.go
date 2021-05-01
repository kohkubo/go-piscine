package main

import (
	"strconv"
)

func calculationStr(args []string) (s string, ok bool) {
	if len(args) != 3 {
		return "", false
	}
	n, err := strconv.Atoi(args[1])
	if err != nil {
		return "", false
	}
	m, err := strconv.Atoi(args[2])
	if err != nil {
		return "", false
	}
	if m == 0 {
		return "", false
	}
	ret := "sum: " + strconv.Itoa(n+m) + "\n"
	ret += "difference: " + strconv.Itoa(n-m) + "\n"
	ret += "product: " + strconv.Itoa(n*m) + "\n"
	ret += "quotient: " + strconv.Itoa(n/m) + "\n"
	return ret, true
}
