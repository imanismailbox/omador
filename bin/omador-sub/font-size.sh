choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
	sed -i "s/^size = .*$/size = $choice/g" ~/.config/alacritty/font-size.toml
	source $OMADOR_PATH/bin/omador-sub/font-size.sh
else
	source $OMADOR_PATH/bin/omador-sub/font.sh
fi
