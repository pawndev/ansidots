.PHONY: init all alacritty zsh tmux 1password bspwm rofi fonts git docker k8s notif userscripts wallpaper lang eww

init:
	ansible-galaxy collection install -r requirements.yml

all:
	ansible-playbook -i hosts playbook.yml --ask-become-pass

alacritty:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags alacritty

zsh:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags zsh

tmux:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags tmux

1password:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags 1password

bspwm:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags bspwm

rofi:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags rofi

fonts:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags fonts

git:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags git

docker:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags docker

k8s:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags k8s

notif:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags notification

userscripts:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags userscripts

wallpaper:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags wallpaper

lang:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags lang

eww:
	ansible-playbook -i hosts playbook.yml --ask-become-pass --tags eww