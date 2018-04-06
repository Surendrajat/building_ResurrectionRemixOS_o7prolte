#!/bin/bash

git clone git@github.com:LineageOS/android_hardware_samsung.git hardware/samsung
git clone git@github.com:LineageOS/android_device_qcom_common.git device/qcom/common
git clone git@github.com:LineageOS/android_device_samsung_qcom-common.git device/samsung/qcom-common
git clone git@github.com:LineageOS/android_packages_resources_devicesettings.git packages/resources/devicesettings
git clone git@github.com:LineageOS/android_external_sony_boringssl-compat.git external/sony/boringssl-compat
git clone git@github.com:Galaxy-MSM8916/android_kernel_samsung_msm8916 kernel/samsung/msm8916
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_msm8916-common device/samsung/msm8916-common
rm -rf vendor/qcom/opensource/dataservices
git clone git@github.com:Galaxy-MSM8916/android_vendor_qcom_opensource_dataservices vendor/qcom/opensource/dataservices
rm -rf hardware/qcom/audio-caf/msm8916
git clone git@github.com:Galaxy-MSM8916/android_hardware_qcom_audio hardware/qcom/audio-caf/msm8916
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_o7-common device/samsung/o7-common
git clone git@github.com:Galaxy-MSM8916/android_device_samsung_o7prolte device/samsung/o7prolte
git clone git@github.com:Galaxy-MSM8916/android-prebuilts-gcc-linux-x86-arm-arm-eabi-7.2.git prebuilts/gcc/linux-x86/arm/arm-eabi-7.2
git clone git@github.com:Galaxy-MSM8916/proprietary_vendor_samsung vendor/samsung
