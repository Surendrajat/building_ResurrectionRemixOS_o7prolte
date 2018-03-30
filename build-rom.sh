#!/bin/bash

############################# Use CCACHE
export USE_CCACHE=1
export CCACHE_DIR=~/RR/.ccache
./prebuilts/misc/linux-x86/ccache/ccache -M 50G

############################# clean previous builds (if any)
#make clean	#deletes all the object files created
#		 OR
make clobber  #deletes all the object files AND the intermediate dependency files generated which specify the dependencies of the cpp files.

############################# Setting up environment variables
. build/envsetup.sh

############################# Choose the target
lunch rr_o7prolte-eng

############################# OutOfMemory in machine with RAM < 16GB solution
# export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
# ./prebuilts/sdk/tools/jack-admin kill-server
# ./prebuilts/sdk/tools/jack-admin start-server

############################# start building
make -j16 bacon
# -jN: N <= 2 * total CPU threads

############################# upload rom
curl --upload-file ./out/target/product/o7prolte/*.zip https://transfer.sh/rr_o7prolte-eng_sk.zip