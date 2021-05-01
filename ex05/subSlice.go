package main

func subSlice(slice []int, begin int, length int, capacity int) []int {
	limit := len(slice) - begin
	sl_len := limit
	if limit < length {
		sl_len = length
	} else {
		sl_len = min(length, limit)
	}
	sl := make([]int, sl_len, max(capacity, sl_len))
	sl_len = min(sl_len, limit)
	for i := 0; i < sl_len; i++ {
		sl[i] = slice[begin+i]
	}
	return sl
}

func max(a int, b int) int {
	if a < b {
		return b
	}
	return a
}

func min(a int, b int) int {
	if a > b {
		return b
	}
	return a
}
