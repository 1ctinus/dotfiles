function readme {
    echo "" > '/home/james/code/1ctinus/README.md'
    nvim '/home/james/code/1ctinus/README.md'
    printf "\n$(date '+%F_%H:%M:%S'):$(cat ~/code/1ctinus/README.md)" >> '/home/james/code/1ctinus/log.txt'
    cd /home/james/code/1ctinus/
    git add README.md
    git add log.txt
    git commit -m "AUTOMATED $(date '+%F_%H:%M:%S')"
    git push -f origin main

}
