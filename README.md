# timsneath/time

This repo compares the startup time for a 'Hello World'-program
implemented in several popular programming langagues.

## Instructions

Paused, we just use time. // Install [hyperfine](https://github.com/sharkdp/hyperfine).

```bash
./simple.sh
```

## Output

Software:

    System Software Overview:

      System Version: macOS 14.5 (23F79)
      Kernel Version: Darwin 23.5.0
      Boot Volume: Macintosh HD
      Boot Mode: Normal
      Secure Virtual Memory: Enabled
      System Integrity Protection: Enabled
      Time since boot: 4 hours, 12 minutes

Hardware:

    Hardware Overview:

      Model Name: MacBook Pro
      Model Identifier: MacBookPro18,1
      Model Number: Z14W000LWN/A
      Chip: Apple M1 Pro
      Total Number of Cores: 10 (8 performance and 2 efficiency)
      Memory: 32 GB
      System Firmware Version: 10151.121.1
      OS Loader Version: 10151.121.1


```plain text
> ./simple.sh
Dart compile: 1.03s 145616 kb
Dart file: 4520192 b
Dart run: 2.23s 13840 kb

Go compile: 0.41s 57056 kb
Go file: 2063346 b
Go run: 2.44s 4304 kb

Java compile: 0.39s 91936 kb
Java file: 1305 b
Java run: 1.74s 42064 kb

Node file: 489 b
Node run: 3.34s 39200 kb

Swift compile: 0.51s 116688 kb
Swift file: 56376 b
Swift run: 1.73s 3712 kb

C (gcc) compile: 0.08s 41152 kb
C (gcc) file: 33640 b
C (gcc) run: 1.70s 1008 kb

C (clang) compile: 0.07s 41216 kb
C (clang) file: 33640 b
C (clang) run: 1.69s 1040 kb

Kotlin (native) compile: 9.97s 795472 kb
Kotlin (native) file: 519864 b
Kotlin (native) run: 1.80s 4752 kb

Rust compile: 0.43s 84928 kb
Rust file: 457944 b
Rust run: 1.74s 1488 kb

Mojo compile: 2.21s 85584 kb
Mojo file: 305112 b
Mojo run: 1.79s 3232 kb
```
