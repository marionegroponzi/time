#!/bin/zsh

export COUNT=10000

mkdir -p {dart,go,java}

echo '\nDart (interpreted)'
./hyperfine 'dart hello.dart' --warmup 10 --runs 100
gtime -f "%es %MkB" dart hello.dart

echo '\nDart (AOT compiled)'
dart compile exe hello.dart -o dart/hello
./hyperfine 'dart/hello' --warmup 10 --runs 100
gtime -f "%es %MkB" dart/hello

echo '\nGo (interpreted)'
./hyperfine 'go run hello.go' --warmup 10 --runs 100
gtime -f "%es %MkB" go run hello.go

echo '\nGo (compiled)'
go build -o go hello.go
./hyperfine 'go/hello' --warmup 10 --runs 100
gtime -f "%es %MkB" go/hello

echo '\nJava (compiled)'
javac -d java hello.java
./hyperfine 'java -cp java HelloWorld' --warmup 10 --runs 100
gtime -f "%es %MkB" java -cp java HelloWorld

echo '\nNode'
./hyperfine 'node hello.js' --warmup 10 --runs 100
gtime -f "%es %MkB" node hello.js

echo '\nPython 3'
./hyperfine 'python3 hello.py' --warmup 10 --runs 100
gtime -f "%es %MkB" python3 hello.py

echo '\nRuby'
./hyperfine 'ruby hello.rb' --warmup 10 --runs 100
gtime -f "%es %MkB" ruby hello.rb

echo 'Shell [skipped - too slow]'
# ./hyperfine './hello.sh' --warmup 10 --runs 100

echo 'Swift (interpreted) [skipped - too slow]'
# ./hyperfine 'swift hello.swift' --warmup 10 --runs 100

echo '\nSwift (compiled)'
swiftc -o swift/hello hello.swift
./hyperfine 'swift/hello' --warmup 10 --runs 100
gtime -f "%es %MkB" swift/hello


