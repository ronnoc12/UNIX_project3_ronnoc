#!/bin/sh
#print menu options
printMenu ()
{
    echo $(date); #prints the date 
    echo "- - - - - - - - - - - - - - - - - ";
    echo " Main Menu ";
    echo "- - - - - - - - - - - - - - - - - ";

    #print menu options
    echo "1. Operating system info";
    echo "2. Hostname and DNS info";
    echo "3. Network info";
    echo "4. Who is online";
    echo "5. Last logged in users";
    echo "6. My IP address";
    echo "7. My disk usage";
    echo "8. My home file-tree";
    echo "9. Process operations";
    echo "10.Exit";

    #prompt for and get choice selection 
    read -p 'Enter your choice [ 1 - 10 ] ' menuChoice;
    echo ''; #newline
}

processMenuChoice ()
{
    #case statement to process menu options
    case $menuChoice in 

        1)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " System information ";
            echo "- - - - - - - - - - - - - - - - - ";
            echo "Operating system : Linux";
            ~/../../usr/bin/lsb_release -a 
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        2)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Hostname and DNS information ";
            echo "- - - - - - - - - - - - - - - - - ";
            #collect information 
            host=$(hostname);
            dns=$(hostname -d);
            qualName=$(hostname --fqdn);
            netAddr=$(hostname -i);
            nameSrvr=$(grep "nameserver" /etc/resolv.conf);

            #print collected info 
            echo "hostname : $host";
            echo "hostname : $dns";
            echo "Fully qualified domain name : $qualName";
            echo "Network address (IP) : $netAddr";
            echo "DNS name servers (DNS IP) : $nameSrvr"

            #prompt for user input to return to menu
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;
    
        3)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Network information ";
            echo "- - - - - - - - - - - - - - - - - ";

            #get and print total number of network interfaces 
            numInterface=$(ls -A /sys/class/net | wc -l);
            echo "Total network interfaces found : $numInterface";

            #print ip addresses information 
            echo "*** IP addresses Information ***";
            ip link show

            #print kernel ip routing table
            echo "***********************";
            echo "*** Network routing ***";
            echo "***********************";
            netstat -rn

            #print interface traffic information 
            echo "*************************************";
            echo "*** Interface traffic information ***";
            echo "*************************************";
            netstat -i

            #prompt for menu return  
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        4)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Who is online ";
            echo "- - - - - - - - - - - - - - - - - ";

            #print who is online 
            echo "NAME     LINE         TIME             COMMENT"; 
            who -s

            #prompt for menu return  
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        5)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " List of last logged in users ";
            echo "- - - - - - - - - - - - - - - - - "; 

            #print last logged in users
            last

            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        6)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Public IP information ";
            echo "- - - - - - - - - - - - - - - - - ";
            
            #print IP address
            curl ifconfig.me
            echo ''; #newline

            #prompt for menu return 
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        7)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Disk usage Info ";
            echo "- - - - - - - - - - - - - - - - - ";

            #get and print disk usage information 
            df --output=pcent,target

            #prompt for menu return 
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        8)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " My home file-tree ";
            echo "- - - - - - - - - - - - - - - - - ";
            
            #call my modified directory tree script from project 1
            sh ./proj1.sh
            echo "Home Directory Tree has been created and saved locally to file filetree.html";

            #prompt for menu return 
            read -p 'Press [Enter] key to continue...' enterChoice;
            echo ''; #newline
            ;;

        9)
            echo "- - - - - - - - - - - - - - - - - ";
            echo " Process operations ";
            echo "- - - - - - - - - - - - - - - - - ";
            
            #call proc script 
            bash ./proc.sh
            ;;

        10)
            ;;

        *)
            echo "Error: Invalid Menu Selection, Please select a number between 1 and 10!"
            echo ''; #newline
            ;; 

    esac
}

while [[ $menuChoice != 10 ]]
do
    printMenu
    processMenuChoice $menuChoice;
done

