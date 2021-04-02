#!/bin/bash
#printf " "
df -h /dev/sda7 | sed -ne '2{p;q}' | awk '{print $5}'
