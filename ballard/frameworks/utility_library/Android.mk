LOCAL_PATH := $(call my-dir)

# --- The main library build
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    $(call all-subdir-java-files)

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.hiqes.android.utility_library
include $(BUILD_JAVA_LIBRARY)

# --- Documentation for the library
include $(CLEAR_VARS)
include $(CLEAR_VARS) 
LOCAL_SRC_FILES := $(call all-subdir-java-files) $(call all-subdir-html-files) 
LOCAL_MODULE:= utility_library
LOCAL_DROIDDOC_OPTIONS := com.hiqes.android.utility_library
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_DROIDDOC_USE_STANDARD_DOCLET := true
include $(BUILD_DROIDDOC)
