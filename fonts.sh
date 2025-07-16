#!/bin/bash

set -euo pipefail

install_dir="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"
repo="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts"
fonts=(
  "FiraCode/Bold/FiraCodeNerdFontMono-Bold.ttf"
  "FiraCode/Light/FiraCodeNerdFontMono-Light.ttf"
  "FiraCode/Medium/FiraCodeNerdFontMono-Medium.ttf"
  "FiraCode/Regular/FiraCodeNerdFontMono-Regular.ttf"
  "FiraCode/Retina/FiraCodeNerdFontMono-Retina.ttf"
  "FiraCode/SemiBold/FiraCodeNerdFontMono-SemiBold.ttf"

  "FiraCode/Bold/FiraCodeNerdFont-Bold.ttf"
  "FiraCode/Light/FiraCodeNerdFont-Light.ttf"
  "FiraCode/Medium/FiraCodeNerdFont-Medium.ttf"
  "FiraCode/Regular/FiraCodeNerdFont-Regular.ttf"
  "FiraCode/Retina/FiraCodeNerdFont-Retina.ttf"
  "FiraCode/SemiBold/FiraCodeNerdFont-SemiBold.ttf"
)

mkdir -p "${install_dir}"
for font in "${fonts[@]}"; do
    wget "${repo}/${font}" -P "${install_dir}"
done

fontconfig_dir="${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig"
mkdir -p "${fontconfig_dir}"
cat << EOF > "${fontconfig_dir}/fonts.conf"
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

  <alias>
    <family>terminal-font</family>
    <prefer>
      <family>Fira Code Nerd Font Mono</family>
      <family>Noto Color Emoji</family>
     </prefer>
  </alias>

</fontconfig>
EOF
fc-cache --really-force
