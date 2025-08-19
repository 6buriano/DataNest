@echo off
echo =============================
echo IoTEste MQTT Test Script (Windows)
echo =============================

REM Suscribirse al tópico en una nueva ventana
start cmd /k "mosquitto_sub -h localhost -t ioteste/sensor/temp -v"

REM Esperar 2 segundos antes de publicar
timeout /t 2 >nul

REM Publicar un mensaje JSON de prueba
mosquitto_pub -h localhost -t "ioteste/sensor/temp" -m "{""device"":""sensor-ht"",""temperature"":22.5,""humidity"":55}"

echo Mensaje publicado en el tópico ioteste/sensor/temp
pause
