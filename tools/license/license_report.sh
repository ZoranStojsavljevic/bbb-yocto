#!/bin/bash

manifest_file="license.manifest"

# Print header
printf "%-40s | %s\n" "Package" "License"
printf -- "----------------------------------------------------------------------\n"

# Parse each valid entry
# Expected format per line: PACKAGE_NAME: LICENSE
grep -vE '^\s*$' "$manifest_file" | while IFS=: read -r package license; do
	# Clean whitespace
	package=$(echo "$package" | xargs)
	license=$(echo "$license" | xargs)

	# Skip malformed lines
	if [[ -n "$package" && -n "$license" ]]; then
		printf "%-40s | %s\n" "$package" "$license"
	fi
done
