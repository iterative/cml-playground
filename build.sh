#!/bin/bash
#shopt -s nullglob

is_mac=$(uname)

build() {
  if [ "$IN_DOCKER" == "1" ]; then
    echo "IN CONTAINER"
    pushd /opt/playground
  fi

  printf "Checking and Building."
  for workflow in workflows/*
  do
    current_file_hash=''
    if test -f ".github/$workflow"; then
      current_file_hash=$(openssl md5 .github/$workflow | awk '{print $2}')
    fi
    new_file_hash=$(cpp -nostdinc -w -P $workflow | sed '/./,$!d' | openssl md5 | awk '{print $2}')
    printf "."
    if test "$current_file_hash" != "$new_file_hash"; then
      printf "\nChange detected: building $workflow > .github/$workflow\n"
      #cpp -nostdinc -P $workflow | sed '/./,$!d' > .github/$workflow
      cpp -nostdinc -w -P $workflow | sed '/./,$!d' > .github/$workflow
    fi
  done
  printf "\n"
}


if [ "$is_mac" == "Darwin" ]; then
  echo "Running with container"
  docker run --rm \
    -v "$(git rev-parse --show-toplevel)":/opt/playground \
    ghcr.io/iterative/cml \
    /opt/playground/build.sh
  exit
fi
build
