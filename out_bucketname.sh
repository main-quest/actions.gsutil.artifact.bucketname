#!/bin/bash

b=$1
if [ -z "$b" ]; then
	repo="$GITHUB_REPOSITORY"
	b_no_slashes=$(echo "$repo" | sed "s/\//_/g") || exit 1
	b_no_dots=$(echo "$b_no_slashes" | sed "s/\./-/g") || exit 2
	b_lowercase=$(echo "$b_no_dots" | (tr '[:upper:]' '[:lower:]')) || exit 3
	b=gh-runs_"$b_lowercase"
	echo "Using $b as implicit bucket name"
fi
echo "::set-output name=value::$b"
