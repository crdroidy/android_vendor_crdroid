# Additional props
PRODUCT_PRODUCT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true \
    ro.com.google.ime.theme_id=5 \
    ro.opa.eligible_device=true \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.setupwizard.mode=OPTIONAL \
    setupwizard.feature.predeferred_enabled=false \
    drm.service.enabled=true \
    persist.sys.dun.override=0 \
    persist.sys.disable_rescue=true

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-crdroid-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-crdroid-product.xml

# Enable dex2oat64 to do dexopt
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

# Extra packages
PRODUCT_PACKAGES += \
    AxSandbox \
    BatteryStatsViewer \
    GameSpace \
    MatLog \
    OmniJaws \
    OmniStyle

# OpenAICore: open on-device intelligence.
#
# Two packages, deliberately. OpenAICore holds the broker, the isolated inference sandbox and the
# third-party API; OpenAICoreModels holds the downloader and is the only one with INTERNET. The
# split is what lets OpenAICore hold android.app.role.SYSTEM_VENDOR_INTELLIGENCE, whose stated
# requirements forbid the holder from requesting INTERNET. Shipping only one of these leaves the
# feature permanently unavailable rather than degraded, so keep them together.
#
# Ships off: nothing is downloaded or run until the user opts in from
# Settings > System > On-device intelligence.
PRODUCT_PACKAGES += \
    OpenAICore \
    OpenAICoreModels

# The LiteRT-LM engine adapter is a prebuilt built out of tree (LiteRT-LM builds with Bazel and
# does not integrate with Soong). Uncomment once prebuilts/litertlm is populated for this branch;
# without it the stack still builds and boots, and reports every feature unavailable.
# PRODUCT_PACKAGES += \
#     libopenaicore_litertlm
