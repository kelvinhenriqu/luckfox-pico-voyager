BTSTACK_VERSION = 4d6a6c4c6e958cbf0104067baa6fb35e80e886a2   # (latest release, adjust if needed)
BTSTACK_SITE = $(call github,bluekitchen,btstack,$(BTSTACK_VERSION))
BTSTACK_LICENSE = BluekitchenLicense
BTSTACK_LICENSE_FILES = LICENSE

BTSTACK_CONF_OPTS =  -DCMAKE_CXX_FLAGS=-I$(STAGING_DIR)/usr/include -DCMAKE_C_FLAGS=-I$(STAGING_DIR)/usr/include
BTSTACK_INSTALL_TARGET = YES
BTSTACK_SUBDIR = port/linux

define BTSTACK_INSTALL_TARGET_CMDS
    rm -rf $(TARGET_DIR)/btstack
    mkdir -p $(TARGET_DIR)/btstack
    cp -a $(@D)/port/linux/. $(TARGET_DIR)/btstack/
endef

$(eval $(cmake-package))