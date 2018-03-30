# building_o7prolte_rr_rom
## Sync-ed First RR ROM
- installing required packages
	```bash
	apt install openjdk-8-jdk android-tools-adb bc bison build-essential ccache curl flex g++-multilib gcc-multilib git-core gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libc6-dev libesd0-dev libgl1-mesa-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libx11-dev libxml2 libxml2-utils lzop maven ncftp pngcrush python-lunch rsync schedtool screen squashfs-tools tmux unzip w3m x11proto-core-dev xsltproc yasm zip zlib1g-dev
	```
	- `openjdk-8-jdk` is a **must have**, better clean `/usr/lib/jvm/` first
- installing `repo` tool
	```bash
	mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
	```
- Created new ~~rr-8.1~~ **RR** dir
	```bash
	mkdir ~/RR && cd ~/RR/
	```
	- **-** in dir name isn't good for building, remove it
- setting up git credential
	```bash
	git config --global user.email "your-email-address"
	git config --global user.name "your-github-username"
	```
- Initializing **RR** repo and downloading the manifest
	```bash
	repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b oreo --depth=1
	```
- syncing the ROM source
	```bash
	repo sync -c --no-tags --no-clone-bundle -f --force-sync -j8
	```
	- -j*N*: *N* can be upto 2 * *No. of total CPU threads*

## Cloned device tree, kernel, vendor etc.
```bash
git clone git@github.com:LineageOS/android_hardware_samsung.git hardware/samsung
git clone git@github.com:LineageOS/android_device_qcom_common.git device/qcom/common
git clone git@github.com:LineageOS/android_device_samsung_qcom-common.git device/samsung/qcom-common
git clone git@github.com:LineageOS/android_packages_resources_devicesettings.git packages/resources/devicesettings
git clone git@github.com:LineageOS/android_device_samsung_qcom-common.git device/samsung/qcom-common
git clone git@github.com:LineageOS/android_external_sony_boringssl-compat.git external/sony/boringssl-compat
git clone git@github.com:LineageOS/android_packages_apps_FlipFlap.git packages/apps/FlipFlap
git clone git@github.com:Galaxy-MSM8916/android_kernel_samsung_msm8916 kernel/samsung/msm8916
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_msm8916-common device/samsung/msm8916-common
rm -rf vendor/qcom/opensource/dataservices
git clone git@github.com:Galaxy-MSM8916/android_vendor_qcom_opensource_dataservices vendor/qcom/opensource/dataservices
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_o7prolte device/samsung/o7prolte
git clone git@github.com:on7pro/vendor_samsung vendor/samsung
git clone git@github.com:Galaxy-MSM8916/android-prebuilts-gcc-linux-x86-arm-arm-eabi-7.2.git prebuilts/gcc/linux-x86/arm/arm-eabi-7.2
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_o7-common device/samsung/o7-common
```

## Building the ROM
- Enabled 50GB CACHE
	```bash
	export USE_CCACHE=1
	export CCACHE_DIR=~/RR/.ccache
	./prebuilts/misc/linux-x86/ccache/ccache -M 50G
	```
- Clean previous builds (if any)
	```bash
	make clean	#deletes all the object files created
	# OR
	make clobber  #deletes all the object files AND the intermediate dependency files generated which specify the dependencies of the cpp files.
	```
- Setting up environment variables
	` . build/envsetup.sh`
- Choose the target
	 `lunch rr_o7prolte-eng`
 - OutOfMemory in machine with RAM < 16GB [solution](http://www.2net.co.uk/blog/jack-server.html)
	 ```bash
	export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
	./prebuilts/sdk/tools/jack-admin kill-server
	./prebuilts/sdk/tools/jack-admin start-server
	```
- Build it!!!
	`make -j4 bacon`
