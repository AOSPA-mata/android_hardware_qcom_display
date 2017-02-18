LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_COPY_HEADERS_TO     := $(common_header_export_path)
LOCAL_COPY_HEADERS        := TonemapFactory.h Tonemapper.h
LOCAL_SHARED_LIBRARIES    := libEGL libGLESv2 libui libutils libui liblog
include $(BUILD_COPY_HEADERS)

LOCAL_MODULE              := libgpu_tonemapper
LOCAL_MODULE_TAGS         := optional
LOCAL_C_INCLUDES          := $(TARGET_OUT_HEADERS)/qcom/display/

LOCAL_CFLAGS              := -Wno-missing-field-initializers -Wall \
                             -Wno-unused-parameter -std=c++11 -DLOG_TAG=\"GPU_TONEMAPPER\"

LOCAL_SRC_FILES           := TonemapFactory.cpp \
                             glengine.cpp \
                             EGLImageBuffer.cpp \
                             EGLImageWrapper.cpp \
                             Tonemapper.cpp

include $(BUILD_SHARED_LIBRARY)
