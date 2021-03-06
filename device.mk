#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL aries devices, and
# are also specific to aries devices
#
# Everything in this directory will become public

LOCAL_PATH := device/xiaomi/aries

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

# WIFI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service

# Hostapd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_xiaomi_extra.xml:system/etc/media_codecs_xiaomi_extra.xml

# GPS configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# MPDecision configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald-8064.conf:system/etc/thermald-8064.conf \
    $(LOCAL_PATH)/configs/thermald-8064ab.conf:system/etc/thermald-8064ab.conf \
    $(LOCAL_PATH)/configs/thermald-8960.conf:system/etc/thermald-8960.conf \
    $(LOCAL_PATH)/configs/thermald-8960ab.conf:system/etc/thermald-8960ab.conf \
    $(LOCAL_PATH)/configs/thermal-engine-8064.conf:system/etc/thermal-engine-8064.conf \
    $(LOCAL_PATH)/configs/thermal-engine-8064ab.conf:system/etc/thermal-engine-8064ab.conf \
    $(LOCAL_PATH)/configs/thermal-engine-8960.conf:system/etc/thermal-engine-8960.conf

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960_liquid.kl:system/usr/keylayout/keypad_8960_liquid.kl \
    $(LOCAL_PATH)/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
    $(LOCAL_PATH)/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
    $(LOCAL_PATH)/keylayout/sensor00fn1a.kl:system/usr/keylayout/sensor00fn1a.kl \
    $(LOCAL_PATH)/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl \
    $(LOCAL_PATH)/keylayout/ft5x06.kl:system/usr/keylayout/ft5x06.kl \
    $(LOCAL_PATH)/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl

# Chargermode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/chargeonlymode:root/sbin/chargeonlymode

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# PowerProfile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerprofile.sh:system/bin/powerprofile.sh

# Prebuilts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/01.apk:system/priv-app/01/01.apk \
    $(LOCAL_PATH)/prebuilt/Forest.ogg:system/media/audio/alarms/Forest.ogg \
    $(LOCAL_PATH)/prebuilt/Journey.ogg:system/media/audio/alarms/Journey.ogg \
    $(LOCAL_PATH)/prebuilt/Smooth.ogg:system/media/audio/alarms/Smooth.ogg \
    $(LOCAL_PATH)/prebuilt/SMS.ogg:system/media/audio/notifications/SMS.ogg \
    $(LOCAL_PATH)/prebuilt/Chorus.ogg:system/media/audio/ringtones/Chorus.ogg \
    $(LOCAL_PATH)/prebuilt/Journey.ogg:system/media/audio/ringtones/Journey.ogg \
    $(LOCAL_PATH)/prebuilt/Leisure.ogg:system/media/audio/ringtones/Leisure.ogg \
    $(LOCAL_PATH)/prebuilt/MI.ogg:system/media/audio/ringtones/MI.ogg \
    $(LOCAL_PATH)/prebuilt/Orange.ogg:system/media/audio/ringtones/Orange.ogg \
    $(LOCAL_PATH)/prebuilt/Over_the_horizon.ogg:system/media/audio/ringtones/Over_the_horizon.ogg \
    $(LOCAL_PATH)/prebuilt/S4_Over_the_horizon.ogg:system/media/audio/ringtones/S4_Over_the_horizon.ogg \
    $(LOCAL_PATH)/prebuilt/Smooth.ogg:system/media/audio/ringtones/Smooth.ogg \
    $(LOCAL_PATH)/prebuilt/Tune.ogg:system/media/audio/ringtones/Tune.ogg

# Boot animation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bootanimation.zip:system/media/bootanimation.zip

# USB MTP
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.vold.umsdirtyratio=50 \
    persist.sys.isUsbOtgEnabled=1

# Apps
PRODUCT_PACKAGES += \
    busybox \
    Torch

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

# syspart selector
PRODUCT_PACKAGES += \
    syspart_select

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    libemoji \
    lights.msm8960

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw

# fmradio support
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni

# CodeAurora
PRODUCT_PACKAGES += \
    qcmediaplayer \
    org.codeaurora.Performance \
    javax.btobex \
    libattrib_static \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    QualcommSoftAP \
    libgestures \
    gestures.msm8960 \
    libxml2 \
    libcnefeatureconfig \
    services-ext \
    services \
    ethernet-service \
    wifi-service \
    tcmiface

# Qualcomm random numbers generated
PRODUCT_PACKAGES += \
    qrngd

# Power
PRODUCT_PACKAGES += \
    power.msm8960

PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    dhcpcd.conf \
    wcnss-service \
    libwifi-hal

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.class_main.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    ueventd.qcom.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    mkntfs \
    dumpe2fs \
    resize2fs \
    e2fsck_static \
    mke2fs_static \
    resize2fs_static \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Init
PRODUCT_PACKAGES += \
    init.qcom.post_boot.sh \
    init.qcom.fm.sh \
    init.qcom.bt.sh \
    init.qcom.btdun.sh \
    init.qcom.mdm_links.sh \
    init.qcom.modem_links.sh \
    init.target.rc

# Regional
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Shanghai

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    ril.subscription.types=RUIM \
    persist.radio.apm_sim_not_pwdn=0 \
    ro.telephony.call_ring.multiple=0

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180 \
    wlan.driver.ath=0

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so
    com.qc.hardware=true \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sensors.wl_dis=true

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.lowlatency.rec=false \
    ro.qc.sdk.audio.fluencetype=none \
    af.resampler.quality=255 \
    lpa.use-stagefright=true \
    qcom.hw.aac.encoder=true \
    lpa.decode=false \
    tunnel.decode=false \
    tunnel.audiovideo.decode=false \
    mm.enable.qcom_parser=33395 \
    media.aac_51_output_enabled=true

# BT
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd \
    ro.bluetooth.request.master=true \
    ro.bluetooth.remote.autoconnect=true \
    bluetooth.a2dp.sink.enabled=false

# transmitter isn't supported
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.transmitter=false

# netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.rmnet.mux=disabled

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    debug.egl.recordable.rgba8888=1

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0

# Gps
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.use-awesome=true

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb

# Optimize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=false \
    ro.config.nocheckin=1 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# Audios
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=MI.ogg \
    ro.config.notification_sound=pizzicato.ogg \
    ro.config.alarm_alert=Alarm_Beep_03.ogg

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

