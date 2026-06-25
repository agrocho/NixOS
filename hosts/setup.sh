#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

header() {
    clear
    echo -e "${BOLD}${CYAN}"
    echo "  ╔══════════════════════════════════════════╗"
    echo "  ║       AgrOS Configuration Manager        ║"
    echo "  ╚══════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo "  Working directory: $SCRIPT_DIR"
    echo ""
}

apply_config() {
    local host="$1"
    echo ""
    echo -e "${BOLD}Applying configuration for ${CYAN}${host}${RESET}..."
    echo ""
    sudo nixos-rebuild switch --flake ".#${host}"
    echo ""
    echo -e "${GREEN}Done!${RESET}"
}

run_alejandra() {
    echo ""
    echo -e "${BOLD}Formatting all .nix files with alejandra...${RESET}"
    echo ""
    if command -v alejandra &>/dev/null; then
        alejandra .
    else
        echo "alejandra not found — running via nix..."
        nix run nixpkgs#alejandra -- .
    fi
    echo ""
    echo -e "${GREEN}Done!${RESET}"
}

while true; do
    header
    echo "  What would you like to do?"
    echo ""
    echo -e "  ${BOLD}Apply a NixOS configuration:${RESET}"
    echo "    1) ARG-Toaster"
    echo "    2) ARG-Thunkpad"
    echo ""
    echo -e "  ${BOLD}Maintenance:${RESET}"
    echo "    3) Format .nix files with alejandra"
    echo ""
    echo "    q) Quit"
    echo ""
    read -rp "  Choice: " choice

    case "$choice" in
        1) apply_config "ARG-Toaster" ;;
        2) apply_config "ARG-Thunkpad" ;;
        3) run_alejandra ;;
        q|Q) echo ""; exit 0 ;;
        *) echo -e "\n  ${RED}Invalid option.${RESET}" ;;
    esac

    echo ""
    read -rp "  Press Enter to return to the menu..."
done
