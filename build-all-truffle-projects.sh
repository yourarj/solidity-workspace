#!/bin/bash

# Find all directories containing truffle-config.js, excluding node_modules globally
directories=$(find . -name "truffle-config.js" -not -path "*/node_modules/*" -exec dirname {} \;)

# index 
index=1

# Loop through each directory and run truffle compile
for dir in $directories; do
    if [[ -f "$dir/truffle-config.js" ]]; then
        echo "----------------------------------------------------------------------"
        echo "[$index] Compiling contracts in $dir"
        # echo "Compiling contracts in $dir/truffle-config.js"
        (cd "$dir" && npm install --quiet && truffle compile --quiet)
        # (cd "$dir" && truffle compile --quiet)
        ((index++))
    fi
done