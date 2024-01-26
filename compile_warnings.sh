#!/usr/bin/bash

GREEN_TICK='\U2705'
WARNING='\U26A0'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

echo -e "${GREEN}${GREEN_TICK} Removed compilation generated artifacts${RESET}"
make clean > /dev/null 2>&1 
echo -e "${YELLOW}${WARNING} Compiling and storing stderr to file${RESET}"
#make &> ~/midland/coccinelle_make_warnings.txt
echo -e "${GREEN}${GREEN_TICK} Warnings written successfully${RESET}"
val=$(grep -o Warning ~/midland/coccinelle_make_warnings.txt | wc -l)
echo -e "${BLUE}${GREEN_TICK} The total number of warnings during compilation: $val${RESET}"
echo -e "${BLUE}Open the file? [Y/n]: ${RESET}\c"
read ans
mod_ans=$(echo "$ans" | tr '[:upper:]' ':lower:')
if [ "$mod_ans" = "y" ] || [ "$mod_ans" = "yes" ]; then
	nvim ~/midland/coccinelle_make_warnings.txt
else
	echo -e "${RED}${GREEN_TICK} Exiting now.${RESET}"
fi
