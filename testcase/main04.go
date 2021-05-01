package main

import (
	"fmt"
	"os"
)

const ERROR_MSG string = "Arguments is invalid."

func main() {
	s, ok := calculationStr(os.Args)
	if !ok {
		fmt.Println(ERROR_MSG)
		os.Exit(1)
	}
	fmt.Print(s)
}
