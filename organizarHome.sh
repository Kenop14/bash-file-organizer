#!/bin/bash
# Author: Victor Jair
# Organizar la Carpeta Downloads.

leer() {
    direccion="$1"

    for documents in "$direccion"/*;
    do
        if [ -f "$documents" ]; then
            identificar "$documents"
        fi
    done
}

identificar() {
    archivo="$1"
    destino=""

    case "$archivo" in
        *.pdf)
            destino=$(crearCarpeta "Documents" "Pdf")
            organizar "$archivo" "$destino"
            ;;
        *.jpg|*.jpeg) 
            destino=$(crearCarpeta "Pictures" "Jpg")
            organizar "$archivo" "$destino"
            ;;
        *.png)        
            destino=$(crearCarpeta "Pictures" "Png")
            organizar "$archivo" "$destino"
            ;;
        *.jar)
            destino=$(crearCarpeta "Documents" "Jar")
            organizar "$archivo" "$destino"
            ;;
        *.docx|*.doc)
            destino=$(crearCarpeta "Documents" "Word")
            organizar "$archivo" "$destino"
            ;;
        *.pptx)
            destino=$(crearCarpeta "Documents" "PPoint")
            organizar "$archivo" "$destino"
            ;;
        *.xlsx)
            destino=$(crearCarpeta "Documents" "Excel")
            organizar "$archivo" "$destino"
            ;;
        *.py)
            destino=$(crearCarpeta "Documents" "Python")
            organizar "$archivo" "$destino"
            ;;
        *.java)
            destino=$(crearCarpeta "Documents" "Java")
            organizar "$archivo" "$destino"
            ;;
        *.sh)
            destino=$(crearCarpeta "Documents" "Bash")
            organizar "$archivo" "$destino"
            ;;
        *.c)
            destino=$(crearCarpeta "Documents" "C")
            organizar "$archivo" "$destino"
            ;;
        *.deb)
            destino=$(crearCarpeta "Downloads" "App")
            organizar "$archivo" "$destino"
            ;;
        *.litematic)
            destino=$(crearCarpeta "Documents" "Schematic")
            organizar "$archivo" "$destino"
            ;;
        *.iso|*.iso*)
            destino=$(crearCarpeta "Downloads" "Isos")
            organizar "$archivo" "$destino"
            ;;
        *.zip)
            destino=$(crearCarpeta "Documents" "Zip")
            organizar "$archivo" "$destino"
            ;;
    esac
}

crearCarpeta() {
    ruta="$HOME/$1/${2}Files" 
    mkdir -p "$ruta"
    echo "$ruta"
}

organizar() {
    origen="$1"
    destino="$2"
    mv --backup=numbered "$origen" "$destino/"
}

leer "$HOME"
leer "$HOME/Downloads"
