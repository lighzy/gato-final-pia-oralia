@echo off
REM Gato Numerico - Jugar con doble clic (sin abrir la terminal)
REM Este archivo debe estar dentro de la carpeta gato-numerico-flask.

cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo No se encontro Python. Instalalo desde python.org y vuelve a intentar.
  pause
  exit /b 1
)

echo Iniciando Gato Numerico...
echo.
echo El juego se abrira en tu navegador en unos segundos.
echo No cierres esta ventana mientras juegas: aqui corre el servidor.
echo Para salir, cierra esta ventana.
echo.

REM Abre el navegador 3 segundos despues, cuando el servidor ya este listo.
start "" cmd /c "timeout /t 3 /nobreak >nul & start http://localhost:5000"

REM El servidor corre en esta ventana (en primer plano).
python app.py

echo.
echo El servidor se detuvo. Si viste un error arriba, revisa que Flask
echo este instalado con: pip install -r requirements.txt
pause
