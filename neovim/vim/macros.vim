"MACROS:
"aligns all words after first space at the 40th column
let @b="0f 40i 40|dwj"

"empty line remove with or without whitespace
let @w=";g/^$\|^s*$/dc"

"using words as separators, title case
let @c=";s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g"

"using spaces as separators, title case
let @s=";s/\<\(\w\)\(\S*\)/\u\1\L\2/g"

"vim non-sort remove duplicates:
let @u=";g/^\(.*\)$\n\1$/d"

"convert windows environment variables to linux environment variables
let @t=";%s/running: setx \\(\\w\\+\\) \\(.*\\)$/export \\1='\\2';ggVG;w !clip.exe"
