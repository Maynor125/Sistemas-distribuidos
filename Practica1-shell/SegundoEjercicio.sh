#!/bin/bash

# Almacenando la fecha en variable.
fecha=$(date +%Y-%m-%d)

# evaluando si el archivo ya existe
if [ -e "procesosFechaHoy-$fecha.list" ]; then
    # Si el archivo ya existe, redirigir la salida 
    echo "------------------------------" >> "procesosFechaHoy-$fecha.list"
    echo "Estado del sistema" >> "procesosFechaHoy-$fecha.list"
    echo "------------------------------" >> "procesosFechaHoy-$fecha.list"
    uptime >> "procesosFechaHoy-$fecha.list"
    echo "------------------------------" >> "procesos-$fecha.list"
    echo "Los 5 procesos que más recursos estan consumiendo son" >> "procesosFechaHoy-$fecha.list"
    echo "------------------------------" >> "procesosFechaHoy-$fecha.list"
    ps aux --sort=-%cpu | head -n 6 >> "procesosFechaHoy-$fecha.list"
else
    # Si el archivo no existe, redirigir la salida estándar al archivo en modo write
    echo "------------------------------" > "procesosFechaHoy-$fecha.list"
    echo "Estado del sistema al ejecutar el script" >> "procesosFechaHoy-$fecha.list"
    echo "------------------------------" >> "procesosFechaHoy-$fecha.list"
    uptime >> "procesosFechaHoy-$fecha.list"
    echo "------------------------------" >> "procesosFechaHoy-$fecha.list"
    echo "5 procesos que más están consumiendo recursos" >> "procesosFechaHoy-$fecha.list"
    echo "------------------------------" >> "procesosFechaHoy-$fecha.list"
	    ps aux --sort=-%cpu | head -n 6 >> "procesosFechaHoy-$fecha.list"
fi

#Ejecutar cada hora con CRON
(crontab -l ; echo "0 * * * * /home/maynorpadilla/procesosFechaHoy-$fecha.list ")
