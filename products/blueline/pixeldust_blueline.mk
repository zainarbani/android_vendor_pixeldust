# Copyright (C) 2019 The PixelDust Project
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

# Bootanimation
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := Pixel 3
export TARGET_DEVICE := blueline

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/crosshatch/aosp_blueline.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Include pixel ambient sense (Now playing)
include vendor/pixeldust/configs/ambientsense.mk

# Google Apps
$(call inherit-product, vendor/googleapps/googleapps.mk)

PRODUCT_NAME := pixeldust_blueline
PRODUCT_DEVICE := blueline
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 3
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=blueline \
    BUILD_FINGERPRINT=google/blueline/blueline:9/PQ3A.190605.003/5524043:user/release-keys \
    PRIVATE_BUILD_DESC="blueline-user 9 PQ3A.190605.003 5524043 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="spezi77"

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Use SDCLANG
TARGET_USE_SDCLANG := true

