package main

import (
	"flag"
	"fmt"
)

func main() {
	var (
		s_flg = flag.String("s", " ", "string")
		n_flg = flag.Bool("n", false, "-n omit trailing newline")
		str string
	)
	flag.Parse()
	if flag.NArg() != 0 {
		str = flag.Args()[0]
		for i := 1; i < flag.NArg(); i++ {
			str += *s_flg
			str += flag.Args()[i]
		}
	}
	fmt.Print(str)
	if *n_flg {
		return
	}
	fmt.Println()
}
