# Use the newest SDK bundled with this Theos installation.
TARGET := iphone:clang:latest:15.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = FilzaSlop

FilzaSlop_FILES = main.m Tweak.m MCMBridge.m MCMFilzaIntegration.m PosterBoardFeature.m ContentView.swift

# --- Flags ---
FilzaSlop_CFLAGS = -I$(PWD)/compat -I$(PWD) -I$(PWD)/XPF/src -I$(PWD)/XPF/external/ChOma/include \
    -fobjc-arc \
    -Wno-unused-function -Wno-unused-variable -Wno-unused-but-set-variable \
    -Wno-incompatible-pointer-types -Wno-incompatible-pointer-types-discards-qualifiers \
    -Wno-deprecated-declarations -Wno-nonportable-include-path -Wno-format
FilzaSlop_CFLAGS += -Wno-arc-performSelector-leaks

FilzaSlop_CCFLAGS = $(FilzaSlop_CFLAGS)
FilzaSlop_OBJCFLAGS = $(FilzaSlop_CFLAGS)
FilzaSlop_OBJCCFLAGS = $(FilzaSlop_CFLAGS)

FilzaSlop_FRAMEWORKS = UIKit Foundation IOKit CoreFoundation Security
FilzaSlop_PRIVATE_FRAMEWORKS = IOSurface
FilzaSlop_LIBRARIES = z sandbox

include $(THEOS_MAKE_PATH)/application.mk
