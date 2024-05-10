#!/bin/bash
function is_prime() {
    if [ $1 -le 1 ]; then
        return 1
    fi

    for ((i=2; i<$1; i++)); do
        if [ $(($1 % $i)) -eq 0 ]; then
            return 1
        fi
    done

    return 0
}

function fill_primes_til() {
    local l=()
    for ((count=0; count<$1; count++)); do
        if is_prime $count; then
            l+=($count)
        fi
    done
    echo ${l[@]}
}

count=${COUNT}
primes=( $(fill_primes_til $count) )
echo "${#primes[@]} primes between 1 and ${count}"