#!/bin/bash

CWD=$(pwd)

cd  hardware/samsung
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  device/qcom/common
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  device/samsung/qcom-common
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  packages/resources/devicesettings
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  device/samsung/qcom-common
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  external/sony/boringssl-compat
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  packages/apps/FlipFlap
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  kernel/samsung/msm8916
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  device/samsung/msm8916-common
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  vendor/qcom/opensource/dataservices
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  device/samsung/o7-common
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  device/samsung/o7prolte
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  prebuilts/gcc/linux-x86/arm/arm-eabi-7.2
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD

cd  vendor/samsung
pwd
git branch
varbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ -f .git/refs/remotes/origin/$varbranch ]; then
	rm .git/refs/remotes/origin/$varbranch
	git fetch
fi
git pull
cd $CWD