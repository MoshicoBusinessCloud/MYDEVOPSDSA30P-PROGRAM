#!/bin/sh

# General
# =======
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "I will create you a file called ${USER_NAME}_file"
touch "${USER_NAME}_file"
echo "A quote is \", backslash is \\, backtick is \`. and USER_NAME is ${USER_NAME}" > "${USER_NAME}_file"
# ------------------------------

# For Loop
# =========
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done

read dummy

for i in hello 1 * 2 goodbye 
do
  echo "Looping ... i is set to $i"
done

read dummy
# ------------------------------

# While Loop
# ==========
i=1
while [ "$i" -eq "1" ]
do
  echo "Please type something in (^C to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
  i=2
done

while read INPUT_TEXT
do
  case $INPUT_TEXT in
        "hello")          echo "English";;
        "howdy")          echo "American";;
        "gday")           echo "Australian";;
        "bonjour")        echo "French";;
        "guten tag")      echo "German";;
        *)                echo "Unknown Language: $INPUT_TEXT"  exit;
   esac
done
read dummy
# ------------------------------

# TEST [ ]: if .. then .. else .. elsif .. fi
# ===========================================
# Example:
X=5
if [ "$X" -lt "0" ]
then
  echo "X is less than zero"
fi
if [ "$X" -gt "0" ]; then
  echo "X is more than zero"
fi
[ "$X" -le "0" ] && echo "X is less than or equal to  zero"
[ "$X" -ge "0" ] && echo "X is more than or equal to zero"
[ "$X" = "0" ] &&   echo "X is the string or number \"0\""
[ "$X" = "hello" ] && echo "X matches the string \"hello\""
[ "$X" != "hello" ] && echo "X is not the string \"hello\""
[ -n "$X" ] && echo "X is of nonzero length"
[ -f "$X" ] && echo "X is the path of a real file" || echo "No such file: $X"
[ -x "$X" ] && echo "X is the path of an executable file"
[ "$X" -nt "/etc/passwd" ] && echo "X is a file which is newer than /etc/passwd"

read dummy

[ $X -ne 0 ] && echo "X isn't zero" || echo "X is zero"
[ -f $X ] && echo "X is a file" || echo "X is not a file"
[ -n $X ] && echo "X is of non-zero length" || echo "X is of zero length"

read dummy

# Example:
X=0
while [ -n "$X" ]
do
  echo "Enter some text (RETURN to quit)"
  read X
  echo "You said: $X"
done

read dummy

# Example:
echo -en "Please guess the magic number: "
read X
echo $X | grep "[^0-9]" > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
  # If the grep found something other than 0-9
  # then it's not an integer.
  echo "Sorry, wanted a number"
else
  # The grep found only 0-9, so it's an integer. 
  # We can safely do a test on it.
  if [ "$X" -eq "7" ]; then
    echo "You entered the magic number!"
  else
    echo "No, it is not the magic number!"
  fi
fi

read dummy
# ------------------------------

# Parameters & Arguments
# =======================
# Example:
echo "I was called with $# parameters"
echo "My name is $0"
echo "My first parameter is $1"
echo "My second parameter is $2"
echo "All parameters are $@"

read dummy


# SED - Stream Editor in Linux
# ============================
# sed allows you to edit bodies or streams of text programmatically. 
# The way sed works is simple: it reads text line-by-line into a buffer. 
# For each line, it'll perform the predefined instructions, where applicable. 
# Example 1:
echo "Hello World" | sed s/World/Dave/

# Example 2: Create a file "my_sed_file.txt"
 
$> cat > my_sed_file.txt
      unix is great os. unix is opensource. unix is free os.
      learn operating system.
      unix linux which one you choose.
      unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.

$> sed 's/unix/linux/' my_sed_file.txt

# The below command replaces the 2nd occurrence of the word “unix” with “linux” in a line
$> sed 's/unix/linux/2' my_sed_file.txt

# Replacing all (global - g) the occurrence of the pattern in a line 
$> sed 's/unix/linux/g' my_sed_file.txt

# Replacing from nth occurrence to all occurrences in a line
$> sed 's/unix/linux/3g' my_sed_file.txt

# Replacing string on a specific line number 
$> sed '3 s/unix/linux/' my_sed_file.txt

# Replacing string on a range of lines
$> sed '1,3 s/unix/linux/' my_sed_file.txt

$> cp my_sed_file.txt filename.txt

# To Delete a particular line 
$> sed '5d' filename.txt

# To Delete a last line
$> sed '$d' filename.txt

# To Delete line from range x to y
$> sed '2,4d' filename.txt

# To Delete from nth to last line
$> sed '12,$d' filename.txt

# ---------------------------------------------------------------------

# AWK command in Unix/Linux with examples
# =======================================
# Awk is abbreviated from the names of the developers – Aho, Weinberger, and Kernighan
# Awk is a scripting language used for manipulating data and generating reports.
# Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements 
# that define text patterns that are to be searched for in each line of a document and the action that is to be taken 
# when a match is found within a line.

# Create the following text file for AWK manipulation
$> cat > employee.txt 
        ajay manager account 45000
        sunil clerk account 25000
        varun manager sales 50000
        amit manager account 47000
        tarun peon sales 15000
        deepak clerk sales 23000
        sunil peon sales 13000
        satvik director purchase 80000 

# Default behavior of Awk, with no pattern matching
$> awk '{print}' employee.txt

# Print the lines which match the given pattern. 
$> awk '/manager/ {print}' employee.txt

# Splitting a Line Into Fields ($0 represents the whole line)
$> awk '{print $1,$4}' employee.txt

# Built-In Variables In Awk -> NR, NF, FS 

# NR -> display line nos.
$> awk '{print NR,$0}' employee.txt 

# NF -> no. of fields, built-in variables (Display Last Field)
$> awk '{print $1,$NF}' employee.txt

# Display Line From 3 to 6
$> awk 'NR==3, NR==6 {print NR,$0}' employee.txt
























