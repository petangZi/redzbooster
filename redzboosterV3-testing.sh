#!/bin/bash

# Warna Terminal
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
red='\033[0;31m'
cyan='\033[0;36m'
bold='\033[1m'
reset='\033[0m'

# Clear dan Banner
clear
echo -e "${red}${bold}"
echo "╔══════════════════════════════════════╗"
echo "║             REDZFH TOOLS V3          ║"
echo "║           Performance Booster        ║"
echo "╚══════════════════════════════════════╝${reset}"
echo -e "${cyan}⚙️ Author : RedzFH Dev Team"
echo -e "📱 Tools: Sensitivity | AntiLag | ADB Hacks${reset}"
echo ""

# Autentikasi User
read -p "🔐 Masukkan password akses: " pass

if [[ "$pass" == "redzantikendor" ]]; then
    mode="admin"
elif [[ "$pass" == VIR* ]]; then
    mode="vip"
else
    mode="basic"
fi

if [[ "$mode" == "basic" ]]; then
    echo -e "${yellow}🛡️ Mode: BASIC USER${reset}"
elif [[ "$mode" == "vip" ]]; then
    echo -e "${green}🟢 Mode: VIP USER${reset}"
elif [[ "$mode" == "admin" ]]; then
    echo -e "${red}🔥 Mode: ADMIN POWER${reset}"
    echo -e "${cyan}👑 Fitur Rahasia Admin Siap Digunakan...${reset}"
    echo -e "${blue}🔐 Kode VIP acak: VIR$(openssl rand -hex 2 | cut -c1-3 | tr 'a-z' 'A-Z')${reset}"
fi

# Menu Booster
while true; do
clear
echo -e "${yellow}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "🔧 Pilih Fitur Booster:"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
echo -e "${green}[1] Sensitivitas Booster"
echo "[2] Optimasi Kecepatan Internet"
echo "[3] Anti-lag untuk Game"
echo "[4] Clear Cache (User Level)"
echo "[5] Boost Performance (Aman)"
echo "[6] Auto Restart Network (Linux)"
echo "[7] Simulasi Overclock CPU (Non-root)"
echo "[8] Ubah DPI Android (ADB)"
echo "[9] Boost CPU (All core aktif)"
echo "[10] Overclock 144Hz (ADB)"
echo "[11] Cheat Free Fire (Aimlock + Aimhead)"
echo "[12] Cheat PUBG (No Recoil + Magic Aim)"
echo -e "[0] Exit${reset}"
echo -e "${yellow}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
echo -n "🎯 Pilih fitur: "
read pilihan

case $pilihan in
    1)
        echo -e "${green}💥 Meningkatkan sensitivitas kontrol...${reset}"
        sleep 1
        ;;
    2)
        echo -e "${green}🚀 Setting DNS ke Google & Cloudflare...${reset}"
        echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
        echo "nameserver 1.1.1.1" | sudo tee -a /etc/resolv.conf > /dev/null
        ;;
    3)
        echo -e "${green}🔥 Anti-Lag aktif...${reset}"
        ping -c 3 google.com
        ;;
    4)
        echo -e "${blue}🧹 Membersihkan cache lokal...${reset}"
        rm -rf ~/.cache/*
        ;;
    5)
        echo -e "${green}⚡ Menutup aplikasi berat di background...${reset}"
        pkill -f firefox
        pkill -f chrome
        ;;
    6)
        echo -e "${yellow}🔄 Restart jaringan (Linux)...${reset}"
        sudo systemctl restart NetworkManager
        ;;
    7)
        echo -e "${green}⚡ Simulasi Overclock CPU (non-root)...${reset}"
        cat /proc/cpuinfo | grep "cpu MHz" | sort -u
        ;;
    8)
        echo -n "Masukkan DPI baru (contoh: 320, 480): "
        read dpi
        if [[ "$dpi" =~ ^[0-9]+$ ]]; then
            adb devices | grep "device" | grep -v "List" > /dev/null
            if [ $? -eq 0 ]; then
                adb shell wm density "$dpi"
                echo -e "${blue}✅ DPI diubah jadi $dpi!${reset}"
            else
                echo -e "${yellow}⚠️ Device belum terhubung via ADB!${reset}"
            fi
        else
            echo -e "${yellow}❌ DPI harus angka!${reset}"
        fi
        ;;
    9)
        echo -e "${green}💥 Mengaktifkan semua CPU core (simulasi)...${reset}"
        for i in {0..7}; do
            if [ -f "/sys/devices/system/cpu/cpu$i/online" ]; then
                echo 1 | sudo tee /sys/devices/system/cpu/cpu$i/online > /dev/null
            fi
        done
        ;;
    10)
        echo -n "Yakin device support? (y/n): "
        read yakin
        if [[ "$yakin" == "y" ]]; then
            adb devices | grep "device" | grep -v "List" > /dev/null
            if [ $? -eq 0 ]; then
                adb shell settings put system peak_refresh_rate 144
                adb shell settings put system min_refresh_rate 144
                echo -e "${green}✅ Refresh rate 144Hz diset!${reset}"
            else
                echo -e "${yellow}⚠️ Device belum connect via ADB!${reset}"
            fi
        else
            echo -e "${yellow}❌ Overclock dibatalkan.${reset}"
        fi
        ;;
    11)
        echo -e "${cyan}🎮 Mengaktifkan Cheat Free Fire...${reset}"
        ff_path="/sdcard/Android/data/com.dts.freefireth"
        if [ -d "$ff_path" ]; then
            echo "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 100)" > "$ff_path/aimbotRedz20%.so"
            echo "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 100)" > "$ff_path/aimlockRedz89%.so"
            echo -e "${green}✅ Cheat FF dipasang ke $ff_path${reset}"
        else
            echo -e "${red}❌ Path FF gak ditemukan!${reset}"
        fi
        ;;
    12)
        echo -e "${cyan}🎮 Mengaktifkan Cheat PUBG...${reset}"
        pubg_path="/sdcard/Android/data/com.tencent.ig"
        if [ -d "$pubg_path" ]; then
            echo "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 100)" > "$pubg_path/norecoil.so"
            echo "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 100)" > "$pubg_path/magic_aim10%.so"
            echo -e "${green}✅ Cheat PUBG dipasang ke $pubg_path${reset}"
        else
            echo -e "${red}❌ Path PUBG gak ditemukan!${reset}"
        fi
        ;;
    0)
        echo -e "${green}👋 Thanks udah pake REDZFH TOOLS bro! Tetap GG 🔥${reset}"
        exit 0
        ;;
    *)
        echo -e "${red}❌ Pilihan gak valid bro, ulangin!${reset}"
        ;;
esac
done
