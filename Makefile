# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-airoha-npu
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=OpenWrt Community

LUCI_TITLE:=LuCI Airoha NPU Status
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all

# 添加国际化支持
LUCI_I18N:=en zh-cn

define Package/luci-app-airoha-npu
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=Applications
  TITLE:=LuCI Airoha NPU Status
  DEPENDS:=@TARGET_airoha +luci-base
  PKGARCH:=all
endef

define Package/luci-app-airoha-npu/description
  LuCI interface for Airoha NPU (Neural Processing Unit) status monitoring and control.
  This package provides a web interface to monitor and configure the NPU on Airoha platforms.
endef

# 兼容不同的目录结构 - 增强的路径检测
LUCI_PATH := $(wildcard $(TOPDIR)/feeds/luci/luci.mk)
ifeq ($(LUCI_PATH),)
  LUCI_PATH := $(wildcard ../../luci.mk)
endif
ifneq ($(LUCI_PATH),)
  include $(LUCI_PATH)
else
  $(error Cannot find luci.mk. Please ensure LuCI feed is properly configured.)
endif

# call BuildPackage - OpenWrt buildroot signature
