#!/bin/bash
#shopt -s nullglob
echo "Purging existing workflows..."
rm .github/workflows/*
for workflow in workflows/*
do
    echo "Processing $workflow > .github/workflows/$workflow"
    cpp -P $workflow | sed '/./,$!d' > .github/$workflow
done
