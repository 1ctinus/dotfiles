printf '%s' "$(
for i in {1..40}; do
	printf '%s' "${2:-#}"
done
printf "\n"
figlet "$1" | sed -e "s/^/${2:-#} /";
for i in {1..40}; do
	printf '%s' "${2:-#}"
done
printf "\n"
figlet 1ctinus | sed -e "s/^/${2:-#} /";
for i in {1..40}; do
	printf '%s' "${2:-#}"
done
printf "\n"
)$(cat $1)" > "$1"
