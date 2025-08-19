#!/bin/bash
echo "============================="
echo "IoTEste MQTT Test Script (Linux/Mac)"
echo "============================="

# Lanzar suscriptor en background
mosquitto_sub -h localhost -t "ioteste/sensor/temp" -v &
SUB_PID=$!

# Esperar 2 segundos antes de publicar
sleep 2

# Publicar un mensaje JSON de prueba
mosquitto_pub -h localhost -t "ioteste/sensor/temp" -m '{"device":"sensor-ht","temperature":22.5,"humidity":55}'

echo "Mensaje publicado en el tópico ioteste/sensor/temp"
echo "Presiona Ctrl+C para detener el suscriptor"

# Mantener proceso corriendo hasta que el usuario lo detenga
wait $SUB_PID
