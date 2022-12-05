all:build
hello:
	echo "hello"
build:
	go build -o bin/cli main.go
run:
	go run main.go