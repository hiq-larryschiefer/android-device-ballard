# Copyright (C) 2012 The Android Open Source Project
# Copyright (c) 2013 HiQES LLC
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

# Add in the product specific SDK add-on library to the system image
# as a package
PRODUCT_PACKAGES := \
    com.hiqes.android.utility_library

# Copy over the XML permissions file for the library to the system image
PRODUCT_COPY_FILES := \
    device/hiqes/ballard/frameworks/utility_library/com.hiqes.android.utility_library.xml:system/etc/permissions/com.hiqes.android.utility_library.xml \
#    device/generic/goldfish/data/etc/vold.conf:system/etc/vold.conf \

# Name the SDK Add-on
PRODUCT_SDK_ADDON_NAME := utility_library

# The SDK has a manifest declaring what it comes with as well as a hardware
# definition which describes what the hardware looks like.  These must be
# copied as part of the SDK package, so specify them here.  Any custom skins
# can be done here as well.
PRODUCT_SDK_ADDON_COPY_FILES := \
    device/hiqes/ballard/manifest.ini:manifest.ini \
    device/hiqes/ballard/hardware.ini:hardware.ini

# Copy the jar file for the library and exposed APIs into the add-on
PRODUCT_SDK_ADDON_COPY_MODULES := \
    com.hiqes.android.utility_library:libs/utility_library.jar

# Pickup the rules for the exposed APIs.  The SDK generation uses this in
# order to only expose the specified APIs in the public jar file bundled in
# the SDK add-on.
PRODUCT_SDK_ADDON_STUB_DEFS := $(LOCAL_PATH)/utility_library_stub_defs

# Specify the name of the documentation to generate and put into the add-on
# package.  This MUST match the name definition in the library!
PRODUCT_SDK_ADDON_DOC_MODULES := utility_library

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_NAME := ballard
PRODUCT_DEVICE := generic
PRODUCT_BRAND := Android
PRODUCT_MODEL := Generic Android w/HiQES Add-on for the emulator
PRODUCT_CHARACTERISTICS := nosdcard

