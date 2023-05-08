TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless

ARCHS = arm64 arm64e
THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222

PACKAGE_VERSION = 0.0.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = relaunch

relaunch_FILES = Tweak.x
relaunch_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += rela
include $(THEOS_MAKE_PATH)/aggregate.mk
