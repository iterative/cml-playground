#!/bin/bash
#shopt -s nullglob
echo "Purging existing workflows..."
rm .github/workflows/*
for workflow in workflows/*
do
    echo "Processing $workflow > .github/workflows/$workflow"
    #cpp -nostdinc -P $workflow | sed '/./,$!d' > .github/$workflow
    cpp -nostdinc -w -P $workflow | sed '/./,$!d' > .github/$workflow
done
