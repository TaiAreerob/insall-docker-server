#!/bin/sh
echo "Hello Join install program"
echo "You such install program[Y/N]"
read installPrograme

if [[ ( $installPrograme == "Y" || $installPrograme == "y" || $installPrograme == "yes" ) ]]; then
	echo "1 - install all"
	echo "2 - docker"
	echo "Enter your Programe number"
	read n

	if [ $n -eq 1 ]; then
		echo "install all"
		dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo -y
                dnf install docker-ce docker-ce-cli containerd.io -y
                systemctl enable --now docker
		dnf install firewalld -y
		systemctl enable firewalld
		systemctl start firewalld
		firewall-cmd --state
		firewall-cmd --zone=public --add-masquerade --permanent
		firewall-cmd --reload
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		usermod -aG docker $SUDO_USER
		sudo dnf update -y
		sudo dnf install git -y
		git --version
		echo "git instaall complet"
	elif [ $n -eq 2 ]; then
		echo "docker install"
		dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo -y
		dnf install docker-ce docker-ce-cli containerd.io -y
		systemctl enable --now docker
	elif [ $n -eq 3 ]; then
		echo "You got 3rd prize"
	else
		echo "Sorry, try for the next time"
	fi

else
	echo "invalid user"
fi


