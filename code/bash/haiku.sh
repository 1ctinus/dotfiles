
function haiku {
nvim /tmp/haiku.txt
uno=$(sed '1q;d' /tmp/haiku.txt)
dos=$(sed '2q;d' /tmp/haiku.txt)
tres=$(sed '3q;d' /tmp/haiku.txt)
quar=$(sed '4q;d' /tmp/haiku.txt)
  sed -i "113i <h2><span class=\"date\">$(date +'%m-%d-%Y')</span>~<span class=\"name\">${uno}</span></h2><p>${dos}<br>${tres}<br>${quar}</h2>" "/home/james/code/website/haikus.html"
    cd /home/james/code/website/
    rm /tmp/haiku.txt
    printf "add this back james \n"
    git add haikus.html
    git commit -m "HAIKU AUTOMATED $(date '+%F_%H:%M:%S')"
    # git push -f
# <h2><span class="date">11-07-2020</span>~<span class="name">the first one</span></h2>
# <p>this is the first one<br>soon more text here will come soon<br>hope i'm not lazy<h2/>
}
function pain {
nvim /tmp/haiku.txt
echo "$(sed '1q;d' /tmp/haiku.txt)"
echo "$(sed '2q;d' /tmp/haiku.txt)"
echo "$(sed '3q;d' /tmp/haiku.txt)"
echo "$(sed '4q;d' /tmp/haiku.txt)"
}