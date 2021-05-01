package main

import "fmt"

func main() {
	var string_42 string = "42"
	var uint_42 uint = 42
	var int_42 int = 42
	var uint8_42 uint8 = 42
	var int16_42 int16 = 42
	var uint32_42 uint32 = 42
	var int64_42 int64 = 42
	var bool_42 bool = false
	var float32_42 float32 = 42
	var float64_42 float64 = 42
	var complex64_42 complex64 = 42 + 0i
	var complex128_42 complex128 = 42 + 21i
	type FortyTwo struct{}
	var type_42 FortyTwo
	array_42 := [1]int{42}
	var map_42 map[string]int = map[string]int{"42": 42}
	var uintptr_42 *int
	var nil_array_42 []int
	var chan_42 chan int = nil

	fmt.Printf("%s is a %T.\n", string_42, string_42)
	fmt.Printf("%d is a %T.\n", uint_42, uint_42)
	fmt.Printf("%d is an %T.\n", int_42, int_42)
	fmt.Printf("%d is a %T.\n", uint8_42, uint8_42)
	fmt.Printf("%d is an %T.\n", int16_42, int16_42)
	fmt.Printf("%d is a %T.\n", uint32_42, uint32_42)
	fmt.Printf("%d is an %T.\n", int64_42, int64_42)
	fmt.Printf("%t is a %T.\n", bool_42, bool_42)
	fmt.Printf("%.0F is a %T.\n", float32_42, float32_42)
	fmt.Printf("%.0F is a %T.\n", float64_42, float64_42)
	fmt.Printf("%g is a %T.\n", complex64_42, complex64_42)
	fmt.Printf("%g is a %T.\n", complex128_42, complex128_42)
	fmt.Printf("%v is a %T.\n", type_42, type_42)
	fmt.Printf("%v is a %T.\n", array_42, array_42)
	fmt.Printf("%v is a %T.\n", map_42, map_42)
	fmt.Printf("%p is an %T.\n", uintptr_42, uintptr_42)
	fmt.Printf("%d is a %T.\n", nil_array_42, nil_array_42)
	fmt.Printf("%v is a %T.\n", chan_42, chan_42)
	fmt.Printf("%v is a %T.\n", nil, nil)
	fmt.Println()
}
