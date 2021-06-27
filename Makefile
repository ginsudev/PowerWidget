ARCHS = arm64 arm64e
THEOS_DEVICE_IP = 192.168.1.234
PACKAGE_VERSION = 1.1.2
TARGET = iphone:clang:14.4:14
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PowerWidget

PowerWidget_FILES = Tweak.x
PowerWidget_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
