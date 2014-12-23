setup-bashrc:
	@echo "Installing bashrc..."
	-mv ${HOME}/.bashrc ${HOME}/.bashrc.bak
	ln -s $(shell pwd)/bashrc ${HOME}/.bashrc
	@echo "Bashrc installed."

setup-binaries:
	@echo "Copying binaries"
	-rm -rf ${HOME}/bin
	ln -s $(shell pwd)/bin ${HOME}/bin
	@echo "Binaries installed."

setup-vim:
	@echo "Installing vim configuration..."
	-rm -rf ${HOME}/.vim
	ln -s $(shell pwd)/vim ${HOME}/.vim
	@echo "Vim configuration installed."
	@echo "Installing NeoBundle..."
	${HOME}/bin/neobundle.sh
	@echo "NeoBundle installed."

setup-tmux:
	@echo "Installing tmux configuration..."
	-rm ${HOME}/.tmux.conf
	ln -s $(shell pwd)/tmux.conf ${HOME}/.tmux.conf
	@echo "Tmux configuration installed."

setup-xinit:
	@echo "Installing xinitrc..."
	-rm ${HOME}/.xinitrc
	ln -s $(shell pwd)/xinitrc ${HOME}/.xinitrc
	@echo "Xinitrc installed."

setup-thinkpad:
	@echo "Setting up thinkpad middle scroll..."
	-sudo rm /etc/X11/xorg.conf.d/20-thinkpad.conf
	sudo cp $(shell pwd)/xorg/20-thinkpad.conf /etc/X11/xorg.conf.d/
	@echo "Thinkpad middle scroll should now work."

setup-xresources:
	@echo "Setting up xresources..."
	ln -s $(shell pwd)/xresources ${HOME}/.Xresources
	xrdb -merge ~/.Xresources
	@echo "Xresources is now installed."

setup-inputrc:
	@echo "Installing inputrc..."
	-mv ${HOME}/.inputrc ${HOME}/.inputrc.bak
	ln -s $(shell pwd)/inputrc ${HOME}/.inputrc
	@echo "Inputrc installed."

setup-conkyrc:
	@echo "Copying conkyrc"
	-rm -rf ${HOME}/conkyrc
	ln -s $(shell pwd)/conkyrc ${HOME}/conkyrc
	@echo "Installed conkyrc."

setup-icons:
	@echo "Copying icons"
	-rm -rf ${HOME}/icons
	ln -s $(shell pwd)/icons ${HOME}/icons
	@echo "Installed icons."

setup-mpd:
	@echo "Installing mpd.conf"
	-rm -rf ${HOME}/.mpd.conf
	ln -s $(shell pwd)/mpd.conf ${HOME}/.mpd.conf
	@echo "Installed mpd.conf."

setup:
	-make setup-bashrc
	-make setup-binaries
	-make setup-vim
	-make setup-tmux
	-make setup-xinit
	-make setup-thinkpad
	-make setup-xresources
	-make setup-inputrc
	-make setup-conkyrc
	-make setup-icons
	-make setup-mpd
