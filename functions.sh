#!/usr/bin/env bash

###
### Goal: Functional Programming
###

# https://scalastic.io/en/bash-functional-programming/

# Higher-order function to apply a given function to each element of an array
function map() {

    local func=$1
    local array=("${@:2}")
    local result=()

    for element in "${array[@]}"; do
        result+=("$("$func" "$element")")
    done

    echo "${result[@]}"
}
#

function printfnl() {

    local dirs="${@}"

    for dir in "${dirs[@]}" ; do
        printf " %s\n" $dir
    done

}

function find_or_create_dir() {

    local dir="$1"
    local root="${HOME}/.local"

    if [[ ! -d "${root}/{dir}" ]] ; then
        mkdir "${root}/${dir}" &>/dev/null

    fi

}

function pull_repository() {

    local name="$1"
    local _url="https://github.com/tvillega" # harcoded bc source of truth
    local dest="${HOME}/.local/lib/dcc-tools"

    if [[ ! -d "${dest}" ]] ; then
        git -C "${dest}" clone "${_url}/dcc-tools-${name}" "$name"

    fi

}

function init_directories() {

    printf ':: Initializing directories...\n'

    local dirs=("$@")

    printfnl "${dirs[@]}"

    map find_or_create_dir "${dirs[@]}"

}

function init_repositories() {

    printf ':: Downloading repositories...\n'

    local repos=("$@")

    find_or_create_dir "lib/dcc-tools"

    printfnl "${dirs[@]}"

    map pull_repository "${repos[@]}"

}
