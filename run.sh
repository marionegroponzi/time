#!/bin/zsh

export COUNT=100000

mkdir -p {dart,go,java,c,swift}

echo '\nDart (interpreted)'
# ./hyperfine 'dart hello.dart' --warmup 2 --runs 10
gtime -f "%es %MkB" dart hello.dart

echo '\nDart (AOT compiled)'
dart compile exe hello.dart -o dart/hello
# ./hyperfine 'dart/hello' --warmup 2 --runs 10
gtime -f "%es %MkB" dart/hello

echo '\nGo (interpreted)'
# ./hyperfine 'go run hello.go' --warmup 2 --runs 10
gtime -f "%es %MkB" go run hello.go

echo '\nGo (compiled)'
go build -o go hello.go
# ./hyperfine 'go/hello' --warmup 2 --runs 10
gtime -f "%es %MkB" go/hello

echo '\nJava (compiled)'
javac -d java hello.java
# ./hyperfine 'java -cp java HelloWorld' --warmup 2 --runs 10
gtime -f "%es %MkB" java -cp java HelloWorld

echo '\nNode'
# ./hyperfine 'node hello.js' --warmup 2 --runs 10
gtime -f "%es %MkB" node hello.js

echo '\nPython 3'
# ./hyperfine 'python3 hello.py' --warmup 2 --runs 10
gtime -f "%es %MkB" python3 hello.py

echo '\nRuby'
# ./hyperfine 'ruby hello.rb' --warmup 2 --runs 10
gtime -f "%es %MkB" ruby hello.rb

echo '\nShell [skip]'
# ./hyperfine './hello.sh' --warmup 2 --runs 10

echo '\nSwift (interpreted)'
# ./hyperfine 'swift hello.swift' --warmup 2 --runs 10
gtime -f "%es %MkB" swift -O hello.swift

echo '\nSwift (compiled)'
swiftc -O -o swift/hello hello.swift
# ./hyperfine 'swift/hello' --warmup 2 --runs 10
gtime -f "%es %MkB" swift/hello

echo '\nC'
gcc -O -o c/hello hello.c
# ./hyperfine 'C/hello' --warmup 2 --runs 10
gtime -f "%es %MkB" c/hello



