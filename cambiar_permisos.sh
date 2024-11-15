#!/bin/bash

# Validar que se pase una ubicación como parámetro
if [ $# -eq 0 ]; then
    echo "Uso: $0 <ruta_del_directorio>"
    exit 1
fi

RUTA="$1"

# Verificar si la ruta es válida
while [ ! -d "$RUTA" ]; do
    echo "La ruta '$RUTA' no existe. Por favor, ingrese una ruta válida:"
    read RUTA
done

# Archivos de salida
ORIGINAL="$RUTA/original_$(date +%Y%m%d%H%M%S).txt"
FINAL="$RUTA/final_$(date +%Y%m%d%H%M%S).txt"

# Generar original.txt con el listado inicial
echo "Generando listado inicial en $ORIGINAL..."
ls -lR "$RUTA" > "$ORIGINAL"

# Cambiar permisos de los archivos en el directorio principal
echo "Cambiando permisos de los archivos en el directorio principal a 743..."
find "$RUTA" -maxdepth 1 -type f -exec chmod 743 {} \;

# Cambiar permisos de los archivos en los subdirectorios
echo "Cambiando permisos de los archivos en los subdirectorios a 542..."
find "$RUTA" -mindepth 2 -type f -exec chmod 542 {} \;

# Generar final.txt con el listado final
echo "Generando listado final en $FINAL..."
ls -lR "$RUTA" > "$FINAL"

# Finalizar
echo "Proceso completado. Archivos generados:"
echo "- $ORIGINAL"
echo "- $FINAL"
