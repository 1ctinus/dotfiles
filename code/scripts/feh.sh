#!/bin/sh
while :; do
	feh --bg-fill "$(curl -sH "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36" https://www.reddit.com/r/pics/new/.json | jq -r '.data.children[0].data.url_overridden_by_dest')"
sleep 300
done
