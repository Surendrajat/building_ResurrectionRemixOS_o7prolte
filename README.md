### **`ROM & Environment details`**
- OS: **`Resurrection Remix 6.1.0`**
- Android version: **`8.1.0 Oreo`**
- Host OS: **`Ubuntu 16.04+`**

### **`Setup env & Sync ROM Source`**
- Install required packages
	```bash
	sudo apt install openjdk-8-jdk android-tools-adb bc bison build-essential ccache curl flex g++-multilib gcc-multilib git-core gnupg gperf htop imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libc6-dev libcurl4-openssl-dev libesd0-dev libgl1-mesa-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libx11-dev libxml2 libxml2-utils lzop maven ncftp nss-updatedb pngcrush python-lunch rsync schedtool screen squashfs-tools tmux unzip w3m x11proto-core-dev xsltproc yasm zip zlib1g-dev
	```
	- **`openjdk-8-jdk`** is a **must have**, better remove **`oracle-jdk8`** from `/usr/lib/jvm/` first(if exists)
- Install **`repo`** tool
	```bash
	mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
	```
- Setup **`git credential`**
	```bash
	git config --global user.email "your-email-address"
	git config --global user.name "your-git-username"
	```
- Create new **`RR`** dir
	```bash
	mkdir ~/RR && cd ~/RR/
	```
- Initialize **`repo`** in **`RR`** dir with **`default manifest`**
	```bash
	yes | repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b oreo --depth=1
	```
- Clone **`local manifest`** (device tree, kernel source, vendor blobs etc.)
	```bash
	cd .repo && git clone https://github.com/on7/local_manifests && rm local_manifests/aex-oreo.xml && cd ..
	```
- Sync the **`ROM Source`**
	```bash
	repo sync -c --no-tags --no-clone-bundle -f --force-sync -j16
	```
	- `-jN`: `N` <= `2 * No. of total CPU threads`

### **`Build the ROM`**
- Enable **`50GB`** **`CACHE`**
	```bash
	export USE_CCACHE=1
	export CCACHE_DIR=~/RR/.ccache
	./prebuilts/misc/linux-x86/ccache/ccache -M 50G
	```
- Clean previous builds (if any)
	```bash
	make clean			#deletes all the object files created
	# OR
	make clobber  		#deletes all the object files AND the intermediate dependency files generated
	# OR
	make installclean   #cleans recently built installation files only(useful for quick recompilation)
	```
- Setup build environment
	```bash
	. build/envsetup.sh
	```
- Choose the build target
	```bash
	lunch rr_o7prolte-userdebug
	```
 - For RAM < 16GB (**`Jack-server OutOfMemoryError`** [**`solution`**](http://www.2net.co.uk/blog/jack-server.html))
	 ```bash
	export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
	./prebuilts/sdk/tools/jack-admin kill-server
	./prebuilts/sdk/tools/jack-admin start-server
	```
- Finally build it!!!
	```bash
	make -j16 bacon
	```
