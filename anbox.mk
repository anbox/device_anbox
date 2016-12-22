#
# Copyright (C) 2013 The Android Open-Source Project
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

include $(SRC_TARGET_DIR)/product/emulator.mk

# Include drawables for all densities
PRODUCT_AAPT_CONFIG := normal

PRODUCT_COPY_FILES += \
	anbox/scripts/anbox-init.sh:root/anbox-init.sh \
	device/anbox/anbox.xml:system/etc/permissions/anbox.xml

PRODUCT_PACKAGES += \
	anboxd \
	hwcomposer.anbox \
	AnboxAppMgr

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware=goldfish \
	ro.hardware.hwcomposer=anbox \
	ro.kernel.qemu.gles=1 \
	ro.kernel.qemu=1

# Disable any software key elements in the UI
PRODUCT_PROPERTY_OVERRIDES += \
	qemu.hw.mainkeys=1

# Let everything know we're running inside a container
PRODUCT_PROPERTY_OVERRIDES += \
	ro.anbox=1 \
	ro.boot.container=1

# We don't want telephony support for now
PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes

# Disable boot-animation permanently
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.nobootanimation=1
