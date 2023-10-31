#! /bin/bash

function info() {
    printf "\033[1m\033[42m%s\033[0m\n" "$1"
}

function warning() {
    printf "\033[1m\033[43m%s\033[0m\n" "$1"
}

function finished() {
    printf "\033[1m\033[44mThe setup is finished! A reboot may be needed\033[0m\n"
}

export -f info
export -f warning
export -f finished
