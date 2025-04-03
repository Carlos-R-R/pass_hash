#!/bin/bash

# Nombre del archivo de entrada con los hashes NTLM
input_file="ntlm_hashes.txt"

# Comprobamos si el archivo de entrada existe
if [[ ! -f "$input_file" ]]; then
    echo "El archivo $input_file no existe."
    exit 1
fi

# Archivo de salida
output_file="responses.txt"

# Limpiamos el archivo de salida si ya existe
> "$output_file"

# Iteramos sobre cada línea del archivo
while IFS= read -r hash_ntlm; do
    # Ejecutamos el comando curl para cada hash
    response=$(curl -s "https://api.baconhash.pw/${hash_ntlm}")
    
    # Guardamos la respuesta en el archivo de salida
    echo "Hash NTLM: $hash_ntlm, Response: $response" >> "$output_file"
done < "$input_file"

echo "Respuestas guardadas en $output_file"
