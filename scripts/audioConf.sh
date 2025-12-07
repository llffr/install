#!/bin/bash

# Mostrar sinks disponibles
echo "Dispositivos de salida disponibles (sinks)"
pactl list short sinks | awk '{print $1, $2}'

# Pedir al usuario el ID o nombre del sink destino
read -p "Ingrese el ID o nombre del sink de destino: " TARGET_SINK

# Validar si el sink existe
if pactl list short sinks | grep -q "$TARGET_SINK"; then
    echo "✔ Redirigiendo flujos de audio al sink: $TARGET_SINK"

    # Mover cada sink-input (flujo) al nuevo sink
    for input in $(pactl list short sink-inputs | awk '{print $1}'); do
        pactl move-sink-input "$input" "$TARGET_SINK"
    done

    # Establecer como dispositivo de salida predeterminado
    pactl set-default-sink "$TARGET_SINK"

    echo "✔ Todos los flujos redirigidos y sink predeterminado actualizado."
else
    echo "❌ Sink no encontrado: $TARGET_SINK"
    exit 1
fi
