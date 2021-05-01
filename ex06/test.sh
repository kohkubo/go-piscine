go build echo42.go

./echo42 12 34 555 | cat -e > myout
./echo42 -s / a bc def | cat -e >> myout
./echo42 -s XXXXXXX 12 34 56789 | cat -e >> myout
# ./echo42 -n 12 34 555 | cat -e >> myout
# ./echo42 | cat -e >> myout
# ./echo42 -help >> myout

diff test06ans myout
