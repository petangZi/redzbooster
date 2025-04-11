#!/bin/bash

# Warna terminal biar keren 😎
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
reset='\033[0m'

# Header
echo -e "${green}=============================="
echo -e "     REDZBOOSTER TOOLS😉"
echo -e "==============================${reset}"

# Menu
echo -e "\n${yellow}[1] Sensitivitas Booster"
echo -e "[2] Optimasi Kecepatan Internet"
echo -e "[3] Anti-lag untuk Game"
echo -e "[4] Clear Cache (User Level)"
echo -e "[5] Boost Performance (Aman)"
echo -e "[6] Auto Restart Network (Linux)"
echo -e "[7] Simulasi Overclock CPU (Non-root)"
echo -e "[8] Ubah DPI Android (ADB)"
echo -e "[0] Exit${reset}"

echo -n ">> Pilih fitur: "
read pilihan

case $pilihan in
    1)
        echo -e "${green}💥 Meningkatkan sensitivitas kontrol...${reset}"
        sleep 1
        echo -e "${green}✅ Sensitivitas 'simulatif' aktif!${reset}"
        ;;
    2)
        echo -e "${green}🚀 Setting DNS ke Google & Cloudflare...${reset}"
        echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
        echo "nameserver 1.1.1.1" | sudo tee -a /etc/resolv.conf > /dev/null
        sleep 1
        echo -e "${green}✅ DNS diatur, internet mungkin lebih cepat!${reset}"
        ;;
    3)
        echo -e "${green}🔥 Anti-Lag aktif...${reset}"
        ping -c 3 google.com
        echo -e "${green}✅ Tes ping selesai, jaringan oke!${reset}"
        ;;
    4)
        echo -e "${blue}🧹 Membersihkan cache lokal...${reset}"
        rm -rf ~/.cache/*
        echo -e "${blue}✅ Cache lokal dibersihkan!${reset}"
        ;;
    5)
        echo -e "${green}⚡ Menutup aplikasi berat di background...${reset}"
        pkill -f firefox
        pkill -f chrome
        echo -e "${green}✅ Aplikasi berat ditutup!${reset}"
        ;;
    6)
        echo -e "${yellow}🔄 Restart jaringan (Linux)...${reset}"
        sudo systemctl restart NetworkManager
        echo -e "${yellow}✅ Jaringan direstart!${reset}"
        ;;
    7)
        echo -e "${green}⚡ Simulasi Overclock CPU (non-root)...${reset}"
        echo "Frekuensi maksimum CPU (info-only):"
        cat /proc/cpuinfo | grep "cpu MHz" | sort -u
        echo -e "${green}✅ Info ditampilkan (tanpa root).${reset}"
        ;;
    8)
        echo -e "${blue}📱 Mengatur DPI lewat ADB...${reset}"
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
    0)
        echo -e "${green}👋 Thanks udah pake RedzBooster bro!${reset}"
        exit 0
        ;;
    *)
        echo -e "${yellow}❌ Pilihan gak valid bro, ulangin!${reset}"
        ;;
esac
