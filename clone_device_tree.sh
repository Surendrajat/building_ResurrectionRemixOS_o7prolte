#!/bin/bash

git clone git@github.com:LineageOS/android_hardware_samsung.git hardware/samsung --depth=1
git clone git@github.com:LineageOS/android_device_qcom_common.git device/qcom/common --depth=1
git clone git@github.com:LineageOS/android_device_samsung_qcom-common.git device/samsung/qcom-common --depth=1
git clone git@github.com:LineageOS/android_packages_resources_devicesettings.git packages/resources/devicesettings --depth=1
git clone git@github.com:LineageOS/android_device_samsung_qcom-common.git device/samsung/qcom-common --depth=1
git clone git@github.com:LineageOS/android_external_sony_boringssl-compat.git external/sony/boringssl-compat --depth=1
git clone git@github.com:LineageOS/android_packages_apps_FlipFlap.git packages/apps/FlipFlap --depth=1
git clone git@github.com:Galaxy-MSM8916/android_kernel_samsung_msm8916 kernel/samsung/msm8916 --depth=1
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_msm8916-common device/samsung/msm8916-common --depth=1
rm -rf vendor/qcom/opensource/dataservices
git clone git@github.com:Galaxy-MSM8916/android_vendor_qcom_opensource_dataservices vendor/qcom/opensource/dataservices --depth=1
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_o7-common device/samsung/o7-common --depth=1
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_o7prolte device/samsung/o7prolte --depth=1
git clone git@github.com:Galaxy-MSM8916/android-prebuilts-gcc-linux-x86-arm-arm-eabi-7.2.git prebuilts/gcc/linux-x86/arm/arm-eabi-7.2 --depth=1
git clone git@github.com:on7pro/vendor_samsung vendor/samsung --depth=1
