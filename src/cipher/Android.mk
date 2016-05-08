
LOCAL_PATH_BAK := $(LOCAL_PATH)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)


LOCAL_MODULE := pp_qq_common_cipher

ifdef $(LOCAL_MODULE)_c_includes
LOCAL_C_INCLUDES := $($(LOCAL_MODULE)_c_includes)
endif

ifdef $(LOCAL_MODULE)_cflags
LOCAL_CFLAGS := $($(LOCAL_MODULE)_cflags)
endif

ifdef $(LOCAL_MODULE)_cppflags
LOCAL_CPPFLAGS := $($(LOCAL_MODULE)_cppflags)
endif

ifdef $(LOCAL_MODULE)_export_cflags
LOCAL_EXPORT_CFLAGS := $($(LOCAL_MODULE)_export_cflags)
endif

ifdef $(LOCAL_MODULE)_export_cppflags
LOCAL_EXPORT_CPPFLAGS := $($(LOCAL_MODULE)_export_cppflags)
endif

ifdef $(LOCAL_MODULE)_export_c_includes
LOCAL_EXPORT_C_INCLUDES := $($(LOCAL_MODULE)_export_c_includes)
endif

LOCAL_SRC_FILES := aes_cipher.cc block_cipher.cc counter.cc ctr_cipher_mode.cc \
	icipher.cc memxor.cc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../
LOCAL_CPP_FEATURES := rtti exceptions

LOCAL_STATIC_LIBRARIES := pp_qq_common_exception nettle
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/..
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

module_for_test := pp_qq_common_cipher

LOCAL_MODULE := $(module_for_test)_test
LOCAL_SRC_FILES := aes256_ctr_test.cc aes_cipher_test.cc counter_test.cc memxor_test.cc
LOCAL_STATIC_LIBRARIES := googletest_static $(module_for_test) pp_qq_common_string pp_qq_common_hex_coding


include $(BUILD_STATIC_LIBRARY)


LOCAL_PATH := $(LOCAL_PATH_BAK)