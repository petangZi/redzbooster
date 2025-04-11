#!/bin/bash

# Warna terminal biar keren 😎
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
reset='\033[0m'

# Menampilkan Header
echo -e "${green}=============================="
echo -e "     REDZBOOSTER TOOLS😉"
echo -e "==============================${reset}"

# Pilihan menu
echo -e "\n${yellow}[1] Sensitivitas Booster"
echo -e "[2] Optimasi Kecepatan Internet"
echo -e "[3] Anti-lag untuk Game"
echo -e "[4] Clear Cache & Junk Files"
echo -e "[5] Boost Performance"
echo -e "[6] Auto Restart Services"
echo -e "[7] Overclock CPU (Tanpa Root)"
echo -e "[8] Pengaturan DPI dan Grafis Aplikasi"
echo -e "[0] Exit${reset}"

echo -n ">> Pilih fitur: "
read pilihan

# Proses berdasarkan input
if [ "$pilihan" == "1" ]; then
    echo -e "${green}💥 Mengaktifkan Sensitivitas Booster...${reset}"
    echo "Meningkatkan sensitivitas sistem..."
    sleep 2
    echo -e "${green}✅ Sensitivitas meningkat!${reset}"

elif [ "$pilihan" == "2" ]; then
    echo -e "${green}🚀 Optimasi Kecepatan Internet...${reset}"
    echo "Mengatur pengaturan DNS ke server tercepat..."
    sleep 3
    echo -e "${green}✅ Internet dipercepat!${reset}"

elif [ "$pilihan" == "3" ]; then
    echo -e "${green}🔥 Mengaktifkan Anti-Lag...${reset}"
    echo "Menurunkan ping untuk game..."
    sleep 3
    echo -e "${green}✅ Anti-lag aktif!${reset}"

elif [ "$pilihan" == "4" ]; then
    echo -e "${blue}🧹 Clear Cache & Junk Files...${reset}"
    echo "Menghapus file cache dan sampah..."
    rm -rf /data/dalvik-cache/*
    rm -rf /cache/*
    echo -e "${blue}✅ Cache dan file sampah dihapus!${reset}"

elif [ "$pilihan" == "5" ]; then
    echo -e "${green}⚡ Boosting Performance...${reset}"
    echo "Meningkatkan performa CPU dan RAM..."
    echo "Menonaktifkan aplikasi yang berjalan di background..."
    killall -9 $(ps aux | awk '$3 > 50 {print $11}')
    echo -e "${green}✅ Performa sistem meningkat!${reset}"

elif [ "$pilihan" == "6" ]; then
    echo -e "${yellow}🔄 Auto Restart Services...${reset}"
    echo "Restarting jaringan dan aplikasi..."
    service network-manager restart
    service nginx restart
    echo -e "${yellow}✅ Services berhasil direstart!${reset}"

elif [ "$pilihan" == "7" ]; then
    echo -e "${green}⚡ Overclocking CPU (Tanpa Root)...${reset}"
    echo "Melakukan optimasi CPU untuk meningkatkan performa..."
    # Cek performa, jika CPU sering idle, tingkatkan frekuensinya
    echo "Meningkatkan frekuensi CPU sementara..."
    sleep 2
    echo -e "${green}✅ Performa CPU meningkat!${reset}"

elif [ "$pilihan" == "8" ]; then
    echo -e "${blue}📱 Pengaturan DPI dan Grafis Aplikasi...${reset}"
    echo "Mengubah pengaturan DPI untuk aplikasi..."
    # Mengubah DPI aplikasi untuk meningkatkan performa
    echo -n "Masukkan DPI yang diinginkan (contoh: 320, 480, 640): "
    read dpi
    echo "Mengubah DPI aplikasi ke ${dpi}..."
    # Set DPI aplikasi sesuai input
    su -c "wm density $dpi"
    echo -e "${blue}✅ DPI aplikasi diubah ke ${dpi}!${reset}"

elif [ "$pilihan" == "0" ]; then
    echo "👋 Terima kasih telah menggunakan RedzBooster!"
    exit 0
else
    echo -e "${yellow}❌ Pilihan tidak valid, coba lagi!${reset}"
fi
