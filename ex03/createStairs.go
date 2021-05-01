package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) == 2 {
		n, _ := strconv.Atoi(os.Args[1])
		stairs(n, 1)
	}
}

func stairs(n int, p int) {
	if n >= p {
		for i := 0; i < p; i++ {
			fmt.Printf("*")
		}
	} else {
		return
	}
	fmt.Println("")
	stairs(n-p, p+1)
}
