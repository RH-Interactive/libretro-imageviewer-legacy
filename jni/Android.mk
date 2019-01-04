LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_ARCH),arm)
LOCAL_CFLAGS += -DANDROID_ARM
LOCAL_ARM_MODE := arm
endif

ifeq ($(TARGET_ARCH),x86)
LOCAL_CFLAGS +=  -DANDROID_X86
endif

ifeq ($(TARGET_ARCH),mips)
LOCAL_CFLAGS += -DANDROID_MIPS -D__mips__ -D__MIPSEL__
endif

CORE_DIR := ..

LOCAL_MODULE    := retro

SOURCES_C   :=
SOURCES_CXX :=

include $(CORE_DIR)/Makefile.common

LOCAL_SRC_FILES    := $(SOURCES_C)
LOCAL_CFLAGS       := -O2 -std=gnu99 -DINLINE=inline -D__LIBRETRO__

include $(BUILD_SHARED_LIBRARY)
