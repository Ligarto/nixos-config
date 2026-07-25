#!/usr/bin/env bash
# home/scripts/web-bookmarks.sh
declare -A bookmarks=(
  ["GitHub"]="https://github.com/Ligarto"
  ["YouTube"]="https://youtube.com"
  ["NixOS Search"]="https://search.nixos.org/packages"
  ["NVF Docs"]="https://nvf.notashelf.dev/options.html"
  ["Claude AI"]="https://claude.ai/"
  ["Gemini AI"]="https://gemini.google.com/app"
  ["My NixOS"]="https://mynixos.com/"
  ["Devenv Docs"]="https://devenv.sh/"
  ["Raylib Docs"]="https://www.raylib.com/"
)

selected=$(printf '%s\n' "${!bookmarks[@]}" | sort | fuzzel --dmenu --prompt="Search: ")

if [[ -n "${bookmarks[$selected]}" ]]; then
  exec brave-origin "${bookmarks[$selected]}"
elif [[ -n "$selected" ]]; then
  exec brave-origin "https://search.brave.com/search?q=${selected// /+}"
fi
