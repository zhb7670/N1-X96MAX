#!/bin/bash
#===============================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 修改默认IP
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# 移除重复软件包
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-dockerman

# 添加额外软件包
git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan
git clone --depth 1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone --depth 1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns

# filebrowser
git clone --depth 1 https://github.com/Lienol/openwrt-package package/Lienol-packages
mv package/Lienol-packages/luci-app-filebrowser package/ 2>/dev/null || true
rm -rf package/Lienol-packages

# dockerman
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman package/lisaac-dockerman
mv package/lisaac-dockerman/applications/luci-app-dockerman package/ 2>/dev/null || true
rm -rf package/lisaac-dockerman

# eqos
git clone --depth 1 -b openwrt-18.06 https://github.com/immortalwrt/luci package/immortalwrt-luci
mv package/immortalwrt-luci/applications/luci-app-eqos package/ 2>/dev/null || true
rm -rf package/immortalwrt-luci

# 科学上网插件
git clone --depth 1 https://github.com/MilesPoupart/luci-app-vssr package/luci-app-vssr
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
git clone --depth 1 https://github.com/vernesong/OpenClash package/luci-app-openclash
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall package/luci-app-passwall
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall2 package/luci-app-passwall2

# SSR-Plus
git clone --depth 1 https://github.com/fw876/helloworld package/helloworld-src
mv package/helloworld-src/luci-app-ssr-plus package/ 2>/dev/null || true
rm -rf package/helloworld-src

# PassWall 依赖包
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-deps
mv package/passwall-deps/* package/ 2>/dev/null || true
rm -rf package/passwall-deps

# 删除 feeds 中可能存在的旧版本，避免依赖冲突
rm -rf feeds/luci/applications/luci-app-passwall 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-passwall2 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-ssr-plus 2>/dev/null || true

# Themes
git clone --depth 1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird package/luci-theme-neobird
git clone --depth 1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom

# haiibo 主题包
git clone --depth 1 https://github.com/haiibo/packages package/haiibo-packages
mv package/haiibo-packages/luci-theme-atmaterial package/ 2>/dev/null || true
mv package/haiibo-packages/luci-theme-opentomcat package/ 2>/dev/null || true
mv package/haiibo-packages/luci-theme-netgear package/ 2>/dev/null || true
mv package/haiibo-packages/luci-theme-rosy package/ 2>/dev/null || true
rm -rf package/haiibo-packages

# 晶晨宝盒
git clone --depth 1 https://github.com/ophub/luci-app-amlogic package/luci-app-amlogic
sed -i "s|https.*/OpenWrt|https://github.com/haiibo/OpenWrt|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|opt/kernel|https://github.com/ophub/kernel/tree/main/pub/stable|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|ARMv8_PLUS|g" package/luci-app-amlogic/root/etc/config/amlogic

# MosDNS
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns package/mosdns-src
mv package/mosdns-src/luci-app-mosdns package/ 2>/dev/null || true
mv package/mosdns-src/mosdns package/ 2>/dev/null || true
mv package/mosdns-src/v2dat package/ 2>/dev/null || true
rm -rf package/mosdns-src

# DDNS.to
git clone --depth 1 https://github.com/linkease/nas-packages-luci package/nas-luci
mv package/nas-luci/luci/luci-app-ddnsto package/ 2>/dev/null || true
rm -rf package/nas-luci

git clone --depth 1 https://github.com/linkease/nas-packages package/nas-packages
mv package/nas-packages/network/services/ddnsto package/ 2>/dev/null || true
rm -rf package/nas-packages

# 流量监控
git clone --depth 1 https://github.com/haiibo/packages package/wrtbwmon-src
mv package/wrtbwmon-src/luci-app-wrtbwmon package/ 2>/dev/null || true
mv package/wrtbwmon-src/wrtbwmon package/ 2>/dev/null || true
rm -rf package/wrtbwmon-src

# Alist
git clone --depth 1 https://github.com/sbwml/luci-app-alist package/alist-src
mv package/alist-src/luci-app-alist package/ 2>/dev/null || true
mv package/alist-src/alist package/ 2>/dev/null || true
rm -rf package/alist-src

# iStore
git clone --depth 1 https://github.com/linkease/istore-ui package/istore-ui-src
mv package/istore-ui-src/app-store-ui package/ 2>/dev/null || true
rm -rf package/istore-ui-src

git clone --depth 1 https://github.com/linkease/istore package/istore-src
mv package/istore-src/luci package/istore 2>/dev/null || true
rm -rf package/istore-src

# 在线用户
git clone --depth 1 https://github.com/haiibo/packages package/onliner-src
mv package/onliner-src/luci-app-onliner package/ 2>/dev/null || true
rm -rf package/onliner-src

sed -i '/bin\/sh/a\uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '/nlbwmon/a\uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings

# 调整 x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Haiibo/g" package/lean/default-settings/files/zzz-default-settings

# 修改 Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# 删除主题强制默认
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

# 调整 V2ray服务器 到 VPN 菜单
sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm

./scripts/feeds update -a
./scripts/feeds install -a