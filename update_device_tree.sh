#!/bin/bash
###############################################################################
################ updates all trees from clone_dev_tree.sh  ####################
###############################################################################

######  base rom dir eg: ~/RR/
CWD=$(pwd)

######  file containing github links for all device trees
file=clone_device_tree.sh

while IFS= read -r line; do
	if [[ $line = "git clone"* ]]; then
		cd  $(echo $line | cut -d' ' -f 4)
		pwd
		git branch
		varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
		if [ -f .git/refs/remotes/origin/$varbranch ]; then
			rm .git/refs/remotes/origin/$varbranch
			git fetch
		fi
		git pull
		cd $CWD
	fi
done < "$file"
