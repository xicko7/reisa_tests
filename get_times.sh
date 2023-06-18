#!/bin/bash

# Ruta del archivo que contiene las líneas para grep
archivo_lineas="/gpfs/users/fernandezx/internship/reisa_tests/grep.txt"

# Iterar sobre cada línea del archivo
while IFS= read -r linea; do
    result1=$(grep "EST_ANALYTICS_TIME" $(find ./ -name "reisa.log" 2>/dev/null) | grep "$linea")
    result2=$(grep "SIM_WTHOUT_PDI" $(find ./ -name "reisa.log" 2>/dev/null) | grep "$linea")
    result3=$(grep "PDI_DELAY" $(find ./ -name "reisa.log" 2>/dev/null) | grep "$linea")

    echo "$result1"

    if echo "$result2" | grep -q "SIM_WTHOUT_PDI"; then
        echo "$result2"
    else
        echo -e "$(echo -e $result1 | awk {'print $1'}) NO SIM_TIME"
    fi

    if echo "$result3" | grep -q "PDI_DELAY"; then
        echo "$result3"
    else
        echo -e "$(echo -e $result1 | awk {'print $1'}) NO PDI_DELAY"

    fi
done < "$archivo_lineas"
