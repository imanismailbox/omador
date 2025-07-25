set -e

ascii_art='                                        $$\                     
                                        $$ |                    
 $$$$$$\  $$$$$$\$$$$\   $$$$$$\   $$$$$$$ | $$$$$$\   $$$$$$\  
$$  __$$\ $$  _$$  _$$\  \____$$\ $$  __$$ |$$  __$$\ $$  __$$\ 
$$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$ /  $$ |$$ /  $$ |$$ |  \__|
$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |  $$ |$$ |  $$ |$$ |      
\$$$$$$  |$$ | $$ | $$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$  |$$ |      
 \______/ \__| \__| \__| \_______| \_______| \______/ \__|
'

echo -e "$ascii_art"
echo "=> Omador is for fresh Fedorda 41+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo dnf update >/dev/null
sudo dnf install -y git >/dev/null

echo "Cloning Omador..."
rm -rf ~/.local/share/omador
git clone https://github.com/imanismailbox/omador.git ~/.local/share/omador >/dev/null
# if [[ $OMADOR_REF != "master" ]]; then
# 	cd ~/.local/share/omador
# 	git fetch origin "${OMADOR_REF:-stable}" && git checkout "${OMADOR_REF:-stable}"
# 	cd -
# fi

echo "Installation starting..."
source ~/.local/share/omador/install.sh
