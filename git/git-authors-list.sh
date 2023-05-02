#!/usr/bin/env bash

function usage {
  echo "Usage: bash script.sh [path] [options]"
  echo "Options:"
  echo "  --show-files             Show files in search results"
  echo "  --max-depth [depth]      Set maximum search depth (default: 3)"
  echo "  --max-authors [count]    Set maximum number of authors to display (default: 5)"
  echo "  --after [date]           Show results after specified date (format: yyyy-mm-dd)"
  echo "  --before [date]          Show results before specified date (format: yyyy-mm-dd)"
  exit 0
}

# Check for no arguments/help argument
if [[ "$#" -eq 0 || "$1" == "help" ]]; then
  usage
fi

# Check if the first argument is a path
if [[ -d $1 ]]; then
  path="$1"
  shift # past path argument
fi

# Validate path argument
if [[ ! -d "$path" ]]; then
  echo "Error: $path is not a valid directory"
  exit 1
fi

# Set default values for optional flags
max_depth=3
max_authors=5

# Parse optional flags
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
  --show-files)
    show_files="true"
    shift
    ;;
  --max-depth)
    max_depth="$2"
    shift # past argument
    shift # past value
    ;;
  --max-authors)
    max_authors="$2"
    shift # past argument
    shift # past value
    ;;
  --after)
    after="$2"
    shift # past argument
    shift # past value
    ;;
  --before)
    before="$2"
    shift # past argument
    shift # past value
    ;;
  *) # unknown option
    echo "Unknown option: $1"
    exit 1
    ;;
  esac
done

echo "Search params: Path: $path, show_files: $show_files, max depth: $max_depth, max authors: $max_authors, after: $after, before: $before"

find_cmd=(find "$path" -maxdepth "$max_depth")
if [[ -v show_files ]]; then
  find_cmd+=("-type" "d,f")
else
  find_cmd+=("-type" "d")
fi

find_cmd+=("-print0")

while IFS= read -r -d '' dir; do

  cmd=(git shortlog HEAD -n -s --no-merges)

  if [[ -v after ]]; then
    cmd+=("--after" "$after")
  fi

  if [[ -v before ]]; then
    cmd+=("--before" "$before")
  fi

  cmd+=(-- "$dir")

  # echo "${cmd[@]}"
  output=$("${cmd[@]}" | head -n "$max_authors")

  if [[ -n $output ]]; then
    echo "## Developers in path: ${dir}"
    echo "--------------"
    echo "$output"
    echo "--------------"
  fi

done < <("${find_cmd[@]}")
