#!/bin/bash

echo "==================================================="
echo "Setup Virtual Environment dan Jupyter Lab (Skripsi)"
echo "==================================================="

# 1. Pindah ke direktori tempat script ini berada
cd "$(dirname "$0")"
echo "Berada di direktori: $(pwd)"

# 2. Buat virtual environment jika belum ada
if [ ! -f ".env/bin/activate" ]; then
    echo ""
    echo "[Proses] Membuat Virtual Environment baru bernama env..."
    python3 -m venv .env
else
    echo ""
    echo "[Info] Virtual Environment env sudah ditemukan."
fi

# 3. Aktifkan virtual environment
echo ""
echo "[Proses] Mengaktifkan Virtual Environment..."
source .env/bin/activate

# 4. Pastikan Jupyter Lab dan ipykernel terinstal
echo ""
echo "[Proses] Memeriksa dan menginstal Jupyter Lab (Mohon tunggu sebentar)..."
python -m pip install --upgrade pip > /dev/null 2>&1
pip install jupyterlab ipykernel > /dev/null 2>&1

# Daftarkan env sebagai kernel agar muncul di Jupyter Lab
python -m ipykernel install --user --name=env_skripsi --display-name "Python (env_skripsi)" > /dev/null 2>&1

# 5. Jalankan Jupyter Lab
echo ""
echo "[Selesai] Membuka Jupyter Lab. Biarkan jendela terminal ini tetap terbuka!"
echo "==================================================="
export PYTHONUTF8=1
jupyter lab

# Tahan terminal agar tidak langsung tertutup setelah Jupyter Lab berhenti
read -r -p "Tekan Enter untuk keluar..."