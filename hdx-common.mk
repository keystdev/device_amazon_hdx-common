COMMON_FOLDER := device/amazon/hdx-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/hdx-common/hdx-common-vendor.mk)

# AOSP overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_FOLDER)/overlay-common

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Permissions
PRODUCT_COPY_FILES += \
	$(COMMON_FOLDER)/amazon_tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.qcom.rc \
	init.qcom.usb.rc \
	init.target.rc \
	init.class_main.sh \
	init.qcom.class_core.sh \
	init.qcom.factory.sh \
	init.qcom.sensor.sh \
	init.qcom.sh \
	init.qcom.ssr.sh \
	init.qcom.usb.sh \
	ueventd.qcom.rc \
	init.recovery.qcom.rc

# Audio/Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/etc/audio_policy.conf:system/vendor/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/etc/media_profiles.xml:system/vendor/etc/media_profiles.xml \
	$(LOCAL_PATH)/configs/etc/media_codecs.xml:system/vendor/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/etc/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml \
	$(LOCAL_PATH)/configs/etc/mixer_paths.xml:system/vendor/etc/mixer_paths.xml \
	$(LOCAL_PATH)/configs/etc/mixer_paths.xml:system/vendor/etc/mixer_paths_auxpcm.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.msm8974 \
	audio.r_submix.default \
	audio.usb.default \
	libaudio-resampler \
	libqcompostprocbundle \
	libqcomvisualizer \
	libqcomvoiceprocessing

# Device config files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/usr/idc/amazon_touch.idc:system/usr/idc/amazon_touch.idc \
	$(LOCAL_PATH)/configs/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
	$(LOCAL_PATH)/configs/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/configs/usr/keylayout/msm8974-taiko-tablet-snd-card_JACK.kl:system/usr/keylayout/msm8974-taiko-tablet-snd-card_JACK.kl \
	$(LOCAL_PATH)/configs/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl \
	$(LOCAL_PATH)/configs/usr/keylayout/Vendor_1949_Product_0402.kl:system/usr/keylayout/Vendor_1949_Product_0402.kl

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs

PRODUCT_PACKAGES += \
 	libxml2 \
	libnetcmdiface

# Graphics
PRODUCT_PACKAGES += \
	copybit.msm8974 \
	gralloc.msm8974 \
	hwcomposer.msm8974 \
	memtrack.msm8974 \
	liboverlay \
	libqdutils \
	libqservice \
	libqdMetaData

# GPS
PRODUCT_PACKAGES += \
	gps.msm8974

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/etc/flp.conf:system/etc/flp.conf \
	$(LOCAL_PATH)/configs/etc/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/etc/izat.conf:system/etc/izat.conf \
	$(LOCAL_PATH)/configs/etc/lowi.conf:system/etc/lowi.conf \

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sec_config:system/etc/sec_config

# Lights
PRODUCT_PACKAGES += \
	lights.msm8974

# Media
PRODUCT_PACKAGES += \
	libc2dcolorconvert \
	libdivxdrmdecrypt \
	libdashplayer \
	libstagefrighthw \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVdecHevc \
	libOmxVenc \
	qcmediaplayer

# Power
PRODUCT_PACKAGES += \
	power.msm8974

# QRNGD
PRODUCT_PACKAGES += \
	qrngd \
	qrngp

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Keystore
#PRODUCT_PACKAGES += \
#    keystore.msm8974

# USB
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	wpa_supplicant \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf \
	hostapd_default.conf \
	hostapd.accept \
	hostapd.deny \
        wificond

# QCOM Crypto
PRODUCT_PACKAGES += \
	libcryptfs_hw

# BT
PRODUCT_PACKAGES += \
	libbt-vendor

# DTB Tool
PRODUCT_PACKAGES += \
	dtbToolLineage

# Wifi module
PRODUCT_PACKAGES += \
	ath6kl_usb.ko

#PRODUCT_BOOT_JARS += \
#	qcmediaplayer

# ABI fixes for old binaries
PRODUCT_PACKAGES += \
	libshim_libbinder \
	libshim_liblog \
	libshim_libwvm \
    libshim_atomic

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# HIDL
include device/amazon/hdx-common/hidl.mk
DEVICE_MANIFEST_FILE := device/amazon/hdx-common/manifest.xml

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# set private bt-vendor source
$(call project-set-path-variant,bt-vendor,amazon-hdx,device/amazon/hdx-common/libbt-vendor)