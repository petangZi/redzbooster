#!/bin/bash

# Warna Terminal
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
red='\033[0;31m'
cyan='\033[0;36m'
bold='\033[1m'
reset='\033[0m'

clear
# Banner Header
echo -e "${red}${bold}"
echo "╔══════════════════════════════════════╗"
echo "║             REDZFH TOOLS V2          ║"
echo "║           Performance Booster        ║"
echo "╚══════════════════════════════════════╝${reset}"
echo -e "${cyan}⚙️ Author : RedzFH Dev Team"
echo -e "📱 Tools: Sensitivity | AntiLag | ADB Hacks | FF & PUBG Cheat${reset}"
echo ""

# Menu Fancy
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
echo "[11] Cheat FF: Aimlock 89% + Aimhead 20%"
echo "[12] Cheat PUBG: No Recoil + Magic Aim 10%"
echo -e "[0] Exit${reset}"
echo -e "${yellow}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
echo -n "🎯 Pilih fitur: "
read pilihan

# Aksi berdasarkan input
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
    9)
        echo -e "${green}💥 Mengaktifkan semua CPU core (simulasi)...${reset}"
        for i in {0..7}; do
            if [ -f "/sys/devices/system/cpu/cpu$i/online" ]; then
                echo 1 | sudo tee /sys/devices/system/cpu/cpu$i/online > /dev/null
            fi
        done
        echo -e "${green}✅ Semua core aktif! (kalau support)${reset}"
        ;;
    10)
        echo -e "${blue}🚀 Mengatur refresh rate ke 144Hz lewat ADB...${reset}"
        echo -n "Yakin device support? (y/n): "
        read yakin
        if [[ "$yakin" == "y" ]]; then
            adb devices | grep "device" | grep -v "List" > /dev/null
            if [ $? -eq 0 ]; then
                adb shell settings put system peak_refresh_rate 144
                adb shell settings put system min_refresh_rate 144
                echo -e "${green}✅ Device disuruh kerja keras di 144Hz bro! (simulasi sukses)${reset}"
            else
                echo -e "${yellow}⚠️ Device belum connect via ADB!${reset}"
            fi
        else
            echo -e "${yellow}❌ Overclock dibatalkan.${reset}"
        fi
        ;;
    11)
        echo -e "${blue}🎯 Memasang Cheat FF Aimlock 89% + Aimhead 20%...${reset}"
        mkdir -p ~/Android/data/com.dts.freefireth/files/cheats/
        echo "kode_acak_aimbot" > ~/Android/data/com.dts.freefireth/files/cheats/aimbotRedz20%.so
        echo "kode_acak_aimlock" > ~/Android/data/com.dts.freefireth/files/cheats/aimlockRedz89%.so
        echo -e "${green}✅ Cheat FF berhasil disisipkan (dummy).${reset}"
        ;;
    12)
        echo -e "${blue}🎯 Memasang Cheat PUBG No Recoil + Magic Aim 10%...${reset}"
        mkdir -p ~/Android/data/com.tencent.ig/files/cheats/
        echo "kode_acak_norecoil" > ~/Android/data/com.tencent.ig/files/cheats/norecoil.so
        echo "kode_acak_magic" > ~/Android/data/com.tencent.ig/files/cheats/magicaim10%.so
        echo -e "${green}✅ Cheat PUBG berhasil disisipkan (dummy).${reset}"
        ;;
    0)
        echo -e "${green}👋 Thanks udah pake REDZFH TOOLS bro! Tetap GG 🔥${reset}"
        exit 0
        ;;
    *)
        echo -e "${red}❌ Pilihan gak valid bro, ulangin!${reset}"
        ;;
esac
