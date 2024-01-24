#/usr/bin/bash

OUTDIR="ocaml_out"

if [ -d "$OUTDIR" ]; then
    echo -e "\u2713 Build directory exists " 
else
    mkdir "$OUTDIR"
fi

if [ "$#" -eq 0 ]; then
    echo -e "\u2717 Usage: ./compile.sh <ocaml file>"
    exit 0
else
    echo -e "\u2713 Compiling"
    IFS='.' read -ra parts <<< "$1"
    name="${parts[0]}"
    ocamlc -o "$OUTDIR"/"$name".byte "$1"
    rm "$name".c*
fi

echo "Do you want to execute? [Y/n]: "
read execute_verdict

if [ "$execute_verdict" = "Y" ] || [ "$execute_verdict" = "y" ]; then
    echo -e "\u2713 Compiling"
    IFS='.' read -ra parts <<< "$1"
    name="${parts[0]}"
    ./ocaml_out/"$name".byte
else
    echo -e "\u2713 Exiting."
fi