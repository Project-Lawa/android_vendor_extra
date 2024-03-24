LOCAL_PATH := $(call my-dir)
PREBUILT_APKS := $(wildcard $(LOCAL_PATH)/*.apk)
$(foreach apk,$(PREBUILT_APKS), \
    $(eval include $(CLEAR_VARS)) \
    $(eval LOCAL_MODULE := $(notdir $(basename $(apk)))) \
    $(eval LOCAL_MODULE_TAGS := optional) \
    $(eval LOCAL_SRC_FILES := $(LOCAL_MODULE).apk) \
    $(eval LOCAL_CERTIFICATE := PRESIGNED) \
    $(eval LOCAL_MODULE_CLASS := APPS) \
    $(eval LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)) \
    $(eval LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay) \
    $(eval LOCAL_PRODUCT_MODULE := true) \
    $(eval LOCAL_DEX_PREOPT := false) \
    $(eval include $(BUILD_PREBUILT)) \
)
