#!/bin/sh
curl -s "http://wttr.in/$(cat /priv/location.txt )?format=1" | sed 's/^.//'
	# sed -e s/☀️/盛/g  -e s/☁️//g -e s/⛅️/杖/g

