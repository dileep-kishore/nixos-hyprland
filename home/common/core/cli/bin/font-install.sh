font=$1
otf_ttf=$2
mkdir -p ~/.local/share/fonts/"$otf_ttf"
cp "$font" ~/.local/share/fonts/"$otf_ttf"
fc-cache
# Verify that the font has been installed
fc-list -v | grep -i "${font%.*}"
