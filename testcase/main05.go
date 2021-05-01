package main

import (
	"fmt"
)

func main() {
	var orig = []int{0, 1, 2, 3, 4, 5}
	var aaa = []int{}

	test(orig, 0, 3, 3)
	test(orig, 2, 7, 10)
	test(orig, 2, 7, 3)
	test(orig, 2, 4, 100)
	test(orig, 0, 0, 0)
	test(aaa, 0, 0, 0)
	test(aaa, 3, 4, 1434555)
	test(orig, 0, 20, 4)
}

func test(slice []int, begin int, length int, capacity int) {
	var ret []int
	ret = subSlice(slice, begin, length, capacity)
	fmt.Printf("ret = %v, len = %d, cap = %d\n", ret, len(ret), cap(ret))
}
