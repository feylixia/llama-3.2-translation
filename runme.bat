@echo off
echo ===================================================
echo Setup Virtual Environment dan Jupyter Lab (Skripsi)
echo ===================================================

REM 1. Memastikan script berjalan di folder tempat file .bat ini diletakkan
cd /d "%~dp0"
echo Berada di direktori: %cd%

REM 2. Membuat virtual environment bernama env jika belum ada
if not exist ".env\Scripts\activate.bat" (
echo.
echo [Proses] Membuat Virtual Environment baru bernama env...
python -m venv .env
) else (
echo.
echo [Info] Virtual Environment env sudah ditemukan.
)

REM 3. Mengaktifkan virtual environment
echo.
echo [Proses] Mengaktifkan Virtual Environment...
call .env\Scripts\activate.bat

REM 4. Memastikan Jupyter Lab dan ipykernel terinstal di dalam env
echo.
echo [Proses] Memeriksa dan menginstal Jupyter Lab (Mohon tunggu sebentar)...
python -m pip install --upgrade pip >nul 2>&1
pip install jupyterlab ipykernel >nul 2>&1

REM Mendaftarkan env sebagai kernel agar pasti muncul di Jupyter Lab
python -m ipykernel install --user --name=env_skripsi --display-name "Python (env_skripsi)" >nul 2>&1

REM 5. Menjalankan Jupyter Lab
echo.
echo [Selesai] Membuka Jupyter Lab. Biarkan jendela terminal ini tetap terbuka!
echo ===================================================
set PYTHONUTF8=1
jupyter lab

pause