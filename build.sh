#!/bin/bash
#shopt -s nullglob
for workflow in workflows/*
do
    echo "Processing $workflow > .github/workflows/$workflow"
    cpp -P $workflow | sed '/./,$!d' > .github/$workflow
done
