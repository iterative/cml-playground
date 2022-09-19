#!/bin/bash
#shopt -s nullglob

is_mac=$(uname)

build() {
  if [ "$IN_DOCKER" == "1" ]; then
    echo "IN CONTAINER"
    pushd /opt/playground
  fi

  echo "Purging existing workflows..."
  rm .github/workflows/*
  for workflow in workflows/*
  do
    echo "Processing $workflow > .github/workflows/$workflow"
    #cpp -nostdinc -P $workflow | sed '/./,$!d' > .github/$workflow
    cpp -nostdinc -w -P $workflow | sed '/./,$!d' > .github/$workflow
  done
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
