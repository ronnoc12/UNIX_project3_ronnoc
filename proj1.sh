#!/bin/sh

output="filetree.html"

echo "" > $output;
echo "" > out.txt
find ~ | sed -e 's;[^/]*/;|____;g;s;____|; |;g' >> "out.txt"

#used to convert the output from our find function into html stle using awk
awk 'BEGIN { 
        x = 0;
        print "<table border="1">"
    }
    {
        if (NF == 1){
            print "<tr ><td colspan="2">"$i"</td>";
            print "</tr>"
            print "<h1>Directory Tree</h1>"
        } else {
            if (x == 0){
                x++;
                print "<tr><td>"$i"</td></tr>"
            } else {
                x = 0;
                print "<td>"$i"</td></tr>"
            }
        }
    }
    END {
        print "</table>"
    }' "out.txt" > "$output"    

