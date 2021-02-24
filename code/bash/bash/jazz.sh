function jazz {
while :; do
  mpv "https://billwurtz.com/$(shuf -n 1 ~/code/bash/jazz.txt).mp3"
done
}

function loop {
while :; do
  mpv "https://billwurtz.com/$(shuf -n 1 ~/code/bash/wurtz.txt).mp3"
done
}
