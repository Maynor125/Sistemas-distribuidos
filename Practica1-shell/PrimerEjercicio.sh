#!/bin/bash
# Definiendo diccionario  donde se guardaran los valores que corresponden a los numeros romanos
function ValoresRomanos {
case $1 in 
I) echo 1;;
V) echo 5;;
X) echo 10;;
L) echo 50;;
C) echo 100;;
D) echo 500;;
M) echo 1000;;
esac
}

# Pasando como argumento valoresromanos ya que es el primer argumento le pasamos 1
NumeroRomano=$1
# Declarando variables a utilizar
numeroEntero=0

# Cuerpo del ejercicio
for ((x=0; x<${#NumeroRomano}; x++)); do
  # Obteniendo el valor numerico actual del simbolo
  valorActual=(ValoresRomanos "${NumeroRomano: $x:1}")
  valorSiguiente=(ValoresRomanos "${NumeroRomano: $x+1:1}")
  #Evaluamos si el valor actual es menor que el valor siguiennte,restamos
  if [$valorActual -lt $valorSiguiente]; then
  numeroEntero=$((numeroEntero-valorActual))
   # si esta condicion no se cumple entonces se sumaran dichos valores
  else 
  numeroEntero=$((numeroEntero+valorActual))
  fi
done

# Por ultimo mostramos el resultado 
echo $numeroEntero



