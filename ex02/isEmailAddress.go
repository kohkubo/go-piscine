package main

import (
	"fmt"
	"os"
	"regexp"
)

func main() {
	n := len(os.Args)
	if n == 1 {
		fmt.Println("Invalid argument")
	} else {
		for i := 1; i < n; i++ {
			if vaild_email_fmt(os.Args[i]) {
				fmt.Printf("%s is a valid email address.\n", os.Args[i])
			} else {
				fmt.Printf("%s is NOT a valid email address.\n", os.Args[i])
			}
		}
	}
}

func vaild_email_fmt(str string) bool {
	return len(str) <= 256 && regexp.MustCompile(`[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+`).Match([]byte(str))
}
