#!/bin/zsh

export COUNT=200000

mkdir -p {dart,go,java,c,swift,kotlin}

echo '\nDart (interpreted)'
APP=(dart ./hello.dart)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nDart (AOT compiled)'
dart compile exe hello.dart -o dart/hello
APP=(dart/hello)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nGo (interpreted)'
APP=(go run hello.go)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nGo (compiled)'
go build -o go hello.go
APP=(go/hello)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nJava (compiled)'
javac -d java hello.java
APP=(java -cp java HelloWorld)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nNode'
APP=(node hello.js)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

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
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nSwift (compiled)'
swiftc -O -o swift/hello hello.swift
APP=(swift/hello)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nC (gcc)'
gcc -O -o c/hello hello.c
APP=(C/hello)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nC (clang)'
cc -Ofast -o c/hellocc hello.c
APP=(C/hellocc)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt

echo '\nKotlin (compiled)'
kotlinc hello.kt -include-runtime -d kotlin/hello.jar
APP=(java -jar kotlin/hello.jar)
./hyperfine "$APP" --warmup 2 --runs 10
/usr/bin/time -l -h -o log.txt $APP >/dev/null
awk 'NR==2; END{print}' log.txt



