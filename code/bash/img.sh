 process substitution example:
ueberzug layer --parser bash 0< <(
    declare -Ap add_command=([action]="add" [identifier]="example0" [x]="0" [y]="0" [path]="/home/james/Pictures/pray.png")
    declare -Ap add_command=([action]="add" [identifier]="example1" [x]="10" [y]="0" [path]="/home/james/Pictures/2016.png")
    sleep 5
    declare -Ap remove_command=([action]="remove" [identifier]="example0")
    sleep 5
)

# group commands example:
{
    declare -Ap add_command=([action]="add" [identifier]="example0" [x]="0" [y]="0" [path]="/home/james/Pictures/pray.png")
    declare -Ap add_command=([action]="add" [identifier]="example1" [x]="10" [y]="0" [path]="/home/james/Pictures/2016.png")
    read
    declare -Ap remove_command=([action]="remove" [identifier]="example0")
    read
} | ueberzug layer --parser bash
