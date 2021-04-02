#!/bin/env bash
printf '%s' "$(
for _ in {1..40}; do
	printf '%s' "${2:-#}"
done
printf "\n"
figlet "$1" | sed -e "s/^/${2:-#} /";
for _ in {1..40}; do
	printf '%s' "${2:-#}"
done
printf "\n"
figlet 1ctinus | sed -e "s/^/${2:-#} /";
for _ in {1..40}; do
	printf '%s' "${2:-#}"
done
printf "\n"
)$(cat "$1")" > "$1"2
