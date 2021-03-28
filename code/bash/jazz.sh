function jazz {
while :; do
  mpv "https://billwurtz.com/$(shuf -n 1 ~/code/bash/jazz.txt).mp3"
done
}

function loop {
while :; do
song="$(shuf -n 1 ~/code/bash/wurtz.txt)"
clear
echo -e "$song\n"
  mpv "https://billwurtz.com/${song}.mp3"
done
}
