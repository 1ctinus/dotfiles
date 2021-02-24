#!/bin/bash
function comp {
printf "$1" | sed "
s/m/\x1B[105m  /g;
s/p/\x1B[45m  /g;
s/u/\x1B[100m  /g;
s/w/\x1B[107m  /g;
s/f/\x1B[41m  /g;
s/r/\x1B[101m  /g;
s/o/\x1B[41m  /g;
s/y/\x1B[103m  /g;
s/g/\x1B[102m  /g;
s/b/\x1B[44m  /g;
s/z/\x1B[49m  /g;
s/k/\x1B[46m  /g"
}

#red = r
#yellow = y
#green = g
#gray = u
#blue = b
#darkmagenta = p
#white = w
#black = l
#blank = z
#cyan = c
#dark cyan = k
#magenta = m
#darkred = f
function art {
case $1 in
Cplusplus | cplusplus | cpp | c++ | C++)
comp "
zzzrrrrrrrrrzzzz
zzrrrrwwwrrrrzzz
zrrrwwwwwwwrrrzz
rrrwwwwwwwwwrrrz
rrwwwwfffwwwwrrf
rwwwwffrrrwwffrf
rwwwffwrrwrffrrf
rwwwfwwwwwwrrrrf
rwwwfrwffwffrrrf
rwwwwrrfrrfwrrrf
rrwwwwrrrwwwwrrf
rrrwwwwwwwwwffrf
zrrrwwwwwwwffrff
zzrrrfwwwfffrffz
zzzrrrrfffrrffzz
zzzzfffffffffzzz
";
;;
Kotlin | kotlin | kt )
comp "
kkkkkkkymymymymz
kkkkkkymymymympp
kkkkkymymymymppz
kkkkymymymymppzz
kkkymymymymppzzz
kkmmmmmmmmppzzzz
kmmmmmmmmppzzzzz
mmmmmmmmppzzzzzz
mmmmmmmkkzzzzzzz
mmmmmmkkkkzzzzzz
mmmmmkkkkkkzzzzz
mmmmkkkkkkkkzzzz
mmmkkkkkkkkkkzzz
mmkkkkkkkkkkkkzz
mkkkkkkkkkkkkkkz
zpbbbbbbbbbbbbbb
z
"
comp "";
;;
*)
printf "we dont know that :(\n"
    ;;
esac
}
