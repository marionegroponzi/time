#!/bin/zsh

export COUNT=100000
export TIMEFMT="%E %Mkb"
rm -fr {dart,go,java,c,swift,kotlin,kotlinNative,rust,mojo/mojo-venv}
mkdir -p {dart,go,java,c,swift,kotlin,kotlinNative,rust}

echo -n "Dart compile: "
time dart compile exe hello.dart -o dart/hello >/dev/null
echo -n "Dart file: "
stat -f"%zb" ./dart/hello
echo -n "Dart run: "
time ./dart/hello >/dev/null
echo ""

echo -n "Go compile: "
time go build -o go hello.go >/dev/null
echo -n "Go file: "
stat -f"%zb" ./go/hello
echo -n "Go run: "
time ./go/hello >/dev/null
echo ""

echo -n "Java compile: "
cd java
time javac -d . ../com/negroponzi/hello.java >/dev/null
jar cfe Hello.jar com.negroponzi.HelloWorld com/negroponzi/HelloWorld.class
cd ..
echo -n "Java file: "
stat -f"%zb" ./java/Hello.jar
echo -n "Java run: "
time java -jar java/Hello.jar >/dev/null
echo ""

echo -n "Node file: "
stat -f"%z b" ./hello.js
echo -n "Node run: "
time node hello.js >/dev/null
echo ""

echo -n "Swift compile: "
time swiftc -O -o swift/hello hello.swift >/dev/null
echo -n "Swift file: "
stat -f"%z b" ./swift/hello
echo -n "Swift run: "
time ./swift/hello >/dev/null
echo ""

echo -n "C (gcc) compile: "
time gcc -O -o c/hello hello.c >/dev/null
echo -n "C (gcc) file: "
stat -f"%zb" ./C/hello
echo -n "C (gcc) run: "
time ./C/hello >/dev/null
echo ""

echo -n "C (clang) compile: "
time gcc -O -o c/hellocc hello.c >/dev/null
echo -n "C (clang) file: "
stat -f"%zb" ./C/hellocc
echo -n "C (clang) run: "
time ./C/hellocc >/dev/null
echo ""

echo -n "Kotlin (native) compile: "
time kotlinc-native -opt helloNative.kt -o kotlinNative/hello >/dev/null
echo -n "Kotlin (native) file: "
stat -f"%zb" ./kotlinNative/hello.kexe
echo -n "Kotlin (native) run: "
time ./kotlinNative/hello.kexe >/dev/null
echo ""

echo -n "Rust compile: "
time rustc -O ./hello.rs -o rust/hello >/dev/null
echo -n "Rust file: "
stat -f"%zb" ./rust/hello
echo -n "Rust run: "
time ./rust/hello >/dev/null
echo ""

echo -n "Mojo compile: "
cd mojo
folder="mojo-venv"
# cert="$HOME/certs/TIAROOTCA2022.pem"

if [ ! -d "$folder" ]; then
    python3 -m venv mojo-venv
    # if [ ! -f "$cert" ]; then
    #     python3 -m venv mojo-venv
    # fi   
fi

source mojo-venv/bin/activate
time mojo build hello.🔥 >/dev/null
echo -n "Mojo file: "
stat -f"%zb" ./hello
echo -n "Mojo run: "
time ./hello >/dev/null
deactivate
cd ..
echo ""