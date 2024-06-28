# path=$1
# if [ -z "$path" ]; then
#     path="."
#     echo "Path not specified, using current directory"
# fi

string=$1

if [ -z "$string" ]; then
    echo "Usage: gdber.sh <path> <string>"
    exit 1
fi

grep -n -H -r "$string" . | sed 's/\.\///' | awk -F':' '{printf "break %s:%d\n", $1, $2}' > /tmp/gdber.gdb && cat /tmp/gdber.gdb

