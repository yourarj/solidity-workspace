#!/bin/bash

# Find all directories containing truffle-config.js, excluding node_modules globally
directories=$(find . -name "truffle-config.js" -not -path "*/node_modules/*" -exec dirname {} \;)

# Loop through each directory and run truffle compile
for dir in $directories; do
    if [[ -f "$dir/truffle-config.js" ]]; then
        echo "Compiling contracts in $dir"
        # echo "Compiling contracts in $dir/truffle-config.js"
        (cd "$dir" && npm install && truffle compile --quiet)
        # (cd "$dir" && truffle compile --quiet)
    fi
done