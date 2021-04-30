#!/bin/bash

#print proc menu options 
printProcMenu ()
{
    echo "(please enter the number of your selection below)";
    echo "";
    echo "1.  Show all processes";
    echo "2.  Kill a process";
    echo "3.  Bring up to top";
    echo "4.  Return to Main Menu"

    #prompt for and get choice selection 
    read -p "" procMenuChoice;
    echo ''; #newline
}

processProcMenuChoice ()
{
    #case statement to process menu options
    case $procMenuChoice in 

        1)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Show all process information";
            echo "- - - - - - - - - - - - - - - - - ";
            
            #print all processes in the correct format
            ps -f -e
            ;;

        2)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Kill a process ";
            echo "- - - - - - - - - - - - - - - - - ";

            #read in the PId of the process to be killed 
            read -p "Please enter the PID of the process you would like to kill: " pidKill;

            #kill the process 
            kill -9 "$pidKill"
            ;;
    
        3)
            top -b
            ;;

        4)
            ok=0 #newline
            ;;

        :q)
            echo "";
            ;;

        *)
            echo "Error: Invalid Menu Selection, Please select a number between 1 and 10!"
            echo ''; #newline
            ;; 

    esac
}

ok=1

while [[ $ok == 1 ]] 
do
    printProcMenu
    processProcMenuChoice $procMenuChoice $ok;

    #prompt for return to menu 
    if test $procMenuChoice -ne 4; then 
        read -p 'Press [Enter] key to continue or :q to return to Main Menu...' procEnterChoice;
        echo ''; #newline
    fi    

    if test "$procEnterChoice" == ":q"; then
        ok=0
    fi

    
done
