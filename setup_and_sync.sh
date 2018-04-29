#!/bin/bash

######### installing apt-fast
sudo add-apt-repository -y ppa:apt-fast/stable
sudo apt-get -y update
sudo apt-get -y install apt-fast

######### upgrading the system
sudo apt-fast -y upgrade

####### installing required packages
sudo apt-fast -y install openjdk-8-jdk android-tools-adb bc bison build-essential ccache curl flex g++-multilib gcc-multilib git-core gnupg gperf htop imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libc6-dev libcurl4-openssl-dev libesd0-dev libgl1-mesa-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libx11-dev libxml2 libxml2-utils lzop maven ncftp nss-updatedb pngcrush python-lunch rsync schedtool screen squashfs-tools tmux unzip w3m x11proto-core-dev xsltproc yasm zip zlib1g-dev

####### installing repo tool
mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo

####### setting up git credential
git config --global user.email "sk2812283@gmail.com" && git config --global user.name "Surendrajat"

####### creating RR dir
mkdir ~/RR && cd ~/RR/

####### Initializing RR repo and downloading the manifest
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b oreo --depth=1

####### cloning local manifest
cd .repo && git clone https://github.com/on7/local_manifests && rm local_manifests/aex-oreo.xml && cd ..

####### syncing the ROM source
repo sync -c --no-tags --no-clone-bundle -f --force-sync -j40
