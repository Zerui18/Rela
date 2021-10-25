TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = rela

rela_FILES = main.m
rela_CFLAGS = -fobjc-arc
rela_CODESIGN_FLAGS = -Sentitlements.plist
rela_INSTALL_PATH = /usr/local/bin
rela_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tool.mk
