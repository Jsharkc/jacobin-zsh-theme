#!/bin/bash

set -e;

if_git_exist=0;

# 判断 git 是否安装，如果没有则安装
if [ -z `command -v git` ]; then
	echo "git not installed";
	if [ ! -z `command -v yum` ]; then
		yum install -y git;
	else
		if [ ! -z `command -v apt-get` ]; then
			apt-get update;
			apt-get install -y git;
		else 
			if [ ! -z `command -v apt` ]; then
				apt update;
				apt install -y git;
			fi
		fi
	fi
fi

# 安装后再判断一次，如果还没有，则说明没有安装成功
if [ -z `command -v git` ]; then
	echo "git not install success";
	exit 1;
fi

# clone 项目
if [ ! -d ./jacobin-zsh-theme ]; then
	git clone https://github.com/Jsharkc/jacobin-zsh-theme.git;
fi

# 把主题复制到 ~/.oh-my-zsh/themes
if [ ! -d ~/.oh-my-zsh/themes ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
fi

if [ ! -d ~/.oh-my-zsh/themes ]; then
	echo ".oh-my-zsh not exist";
	exit 1;
else
	cp ./jacobin-zsh-theme/jacobin1.zsh-theme ~/.oh-my-zsh/themes;
	cp ./jacobin-zsh-theme/jacobin2.zsh-theme ~/.oh-my-zsh/themes;
fi

rm -rf ./jacobin-zsh-theme;

allchar="QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";

if [ -f "~/.zshrc" ]; then
	if [ `uanme`="Darwin" ]; then
		sed -i '' '/^ZSH_THEME="[$allchar]*"/ s/"[$allchar]*"/"jacobin1"/g' ~/.zshrc;
	else 
		sed -i '/^ZSH_THEME="[$allchar]*"/ s/"[$allchar]*"/"jacobin1"/g' ~/.zshrc;
	fi
fi

source ~/.zshrc
