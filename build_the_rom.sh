#!/bin/bash

####### Use CCACHE
export USE_CCACHE=1
export CCACHE_DIR=~/RR/.ccache
./prebuilts/misc/linux-x86/ccache/ccache -M 50G

####### clean previous builds (if any)
#make clean	 #deletes all the object files created
#		 OR
#make clobber  #deletes all the object files AND the intermediate dependency files generated which specify the dependencies of the cpp files.
#		OR
make installclean  #cleans recently built installation files only (useful for recompilation)

####### Limiting Java heap allocation for low physical memory (RAM)
#for example you've 4GB of RAM put 3GB limit for JAVA processes
#export _JAVA_OPTIONS="-Xmx3g"

####### Setting up build environment
# autofill:
# 1	{build-type: Unofficial}
# 0	{changelog: 0 days}
. build/envsetup.sh <<DONE
1
0
DONE

####### Choose the target
lunch rr_o7prolte-userdebug

####### start building
make -j16 bacon
# -jN: N <= 2 * total CPU threads

####### upload rom
curl --upload-file ./out/target/product/o7prolte/*.zip https://transfer.sh/$(ls ./out/target/product/o7prolte/ | grep -m1 .zip)
