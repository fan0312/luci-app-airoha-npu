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

# 平台检查（保留硬件限制）
define Package/luci-app-airoha-npu
  $(call Package/luci/emplate)
  DEPENDS:=@TARGET_airoha +luci-base
endef

define Package/luci-app-airoha-npu/description
  LuCI interface for Airoha NPU (Neural Processing Unit) status monitoring and control
  This package provides a web interface to monitor and configure the NPU on Airoha platforms.
endef

# 兼容不同的目录结构 - 修复路径问题
ifneq ($(wildcard ../../luci.mk),)
  # 如果在 feeds 目录内编译（传统方式）
  include ../../luci.mk
else
  # 如果在 package 目录内编译（直接克隆方式）
  include $(TOPDIR)/feeds/luci/luci.mk
endif

# call BuildPackage - OpenWrt buildroot signature
