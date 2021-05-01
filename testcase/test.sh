# fmt check
gofmt -d ../**/*.go

# ex00
go run ../ex00/hello-world.go | cat -e > myout
diff ./case/test00ans myout
rm myout

# ex01
go run ../ex01/vars.go | cat -e > myout
diff ./case/test01ans myout
rm myout

# ex02
test_code (){
	go run ../ex02/isEmailAddress.go $1
}

test_code > myout
test_code test.test@gmail.com >> myout
test_code a >> myout
test_code descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdes@gmail.com >> myout
test_code descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdess@gmail.com >> myout
test_code descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptodrsdess@gmail.com >> myout
test_code descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescripstoaaa >> myout
test_code descriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescriptorsdescripstoaaada >> myout
diff myout ./case/test02ans
rm myout

# ex03

go run ../ex03/createStairs.go 1 | cat -e > myout
go run ../ex03/createStairs.go 3 | cat -e >> myout
go run ../ex03/createStairs.go 4 | cat -e >> myout
go run ../ex03/createStairs.go 0 | cat -e >> myout
go run ../ex03/createStairs.go 10 | cat -e >> myout
go run ../ex03/createStairs.go 12 | cat -e >> myout
diff myout ./case/test03ans
rm myout

# ex04

cp ./main04.go ../ex04 && \
go build ../ex04/calculation.go ../ex04/main04.go &&
./calculation 12 4 | cat -e > myout
./calculation a 4 | cat -e >> myout
./calculation 4 | cat -e >> myout
./calculation 4 3 3 | cat -e >> myout
./calculation | cat -e >> myout
./calculation 0 0 | cat -e >> myout
./calculation 0 10 | cat -e >> myout
diff myout ./case/test04ans
rm myout calculation ../ex04/main04.go

# ex05

cp ./main05.go ../ex05 && \
go build ../ex05/subSlice.go ../ex05/main05.go && ./subSlice | cat -e > myout
diff myout ./case/test05ans
rm myout  ../ex05/main05.go subSlice

# ex06

go build ../ex06/echo42.go

./echo42 12 34 555 | cat -e > myout
./echo42 -s / a bc def | cat -e >> myout
./echo42 -s XXXXXXX 12 34 56789 | cat -e >> myout
./echo42 -help 2>> myout

diff ./case/test06ans myout

echo -n 12 34 555 | cat -e > ans
./echo42 -n 12 34 555 | cat -e > myout
diff ans myout

echo | cat -e > ans
./echo42 | cat -e > myout
diff ans myout

echo -n | cat -e > ans
./echo42 -n | cat -e > myout

diff ans myout

rm myout ans echo42
