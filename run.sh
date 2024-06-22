#!/bin/zsh

export COUNT=200000

mkdir -p {dart,go,java,c,swift,kotlin,kotlinNative}

echo "" > "./program_metrics.log"

echo '\nDart (interpreted)'
APP=(dart ./hello.dart)
./measure_metrics.sh $APP

echo '\nDart (AOT compiled)'
dart compile exe hello.dart -o dart/hello
APP=(dart/hello)
./measure_metrics.sh $APP

echo '\nGo (interpreted)'
APP=(go run hello.go)
./measure_metrics.sh $APP

echo '\nGo (compiled)'
go build -o go hello.go
APP=(go/hello)
./measure_metrics.sh $APP

echo '\nJava (compiled)'
javac -d java hello.java
APP=(java -cp java HelloWorld)
./measure_metrics.sh $APP

echo '\nNode'
APP=(node hello.js)
./measure_metrics.sh $APP

# echo '\nPython 3'
# ./hyperfine 'python3 hello.py' --warmup 2 --runs 10
# /usr/bin/time -l -h -o log.txt python3 hello.py >/dev/null

# echo '\nRuby'
# ./hyperfine 'ruby hello.rb' --warmup 2 --runs 10
# /usr/bin/time -l -h -o log.txt ruby hello.rb >/dev/null

echo '\nShell [skip]'
# ./hyperfine './hello.sh' --warmup 2 --runs 10

echo '\nSwift (interpreted)'
APP=(swift -O hello.swift)
./measure_metrics.sh $APP

echo '\nSwift (compiled)'
swiftc -O -o swift/hello hello.swift
APP=(swift/hello)
./measure_metrics.sh $APP

echo '\nC (gcc)'
gcc -O -o c/hello hello.c
APP=(C/hello)
./measure_metrics.sh $APP

echo '\nC (clang)'
cc -Ofast -o c/hellocc hello.c
APP=(C/hellocc)
./measure_metrics.sh $APP

echo '\nKotlin (JVM with runtime)'
kotlinc hello.kt -include-runtime -d kotlin/hellor.jar
APP=(java -jar kotlin/hellor.jar)
./measure_metrics.sh $APP

echo '\nKotlin (JVM without runtime)'
kotlinc hello.kt -d kotlin/hello.jar
APP=(java -jar kotlin/hello.jar)
./measure_metrics.sh $APP

echo '\nKotlin (native)'
kotlinc-native -opt helloNative.kt -o kotlinNative/hello
APP=(kotlinNative/hello.kexe)
./measure_metrics.sh $APP

