# path=$1
# if [ -z "$path" ]; then
#     path="."
#     echo "Path not specified, using current directory"
# fi

string=$1

if [ -z "$string" ]; then
    echo "Usage: gdber.sh <string>"
    exit 1
fi

grep -n -H -r "$string" . \
    | sed 's/\.\///' \
    | awk -F':' '{printf "break %s:%d\n", $1, $2}' > /tmp/gdber.gdb

# Print message indicating breakpoints generation
echo "\e[1;32mBREAKPOINTS GENERATED AT /tmp/gdber.gdb\e[0m"

# Display contents of the generated breakpoints file
cat /tmp/gdber.gdb

