#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Remove Some Package
./scripts/feeds uninstall luci-app-docker luci-lib-docker smartdns
#rm -rf package/lean/luci-app-diskman 
rm -rf package/lean/luci-app-docker
rm -rf package/lean/luci-lib-docker

# Add Some Package

mkdir -p package/custom
pushd package/custom
# git clone https://github.com/coolsnowwolf/packages
git clone https://github.com/kenzok8/small
git clone https://github.com/kenzok8/openwrt-packages
git clone https://github.com/Lienol/openwrt-package
git clone https://github.com/fw876/helloworld
git clone https://github.com/openwrt-develop/luci-theme-atmaterial
git clone https://github.com/vernesong/OpenClash
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone -b lede https://github.com/pymumu/luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns
git clone -b 18.06  https://github.com/jerrykuku/luci-theme-argon
wget -O - https://github.com/lisaac/luci-app-dockerman/archive/v0.5.13.tar.gz | tar xfvz -
wget -O - https://github.com/lisaac/luci-lib-docker/archive/v0.3.3.tar.gz | tar xfvz -
#wget -O - https://github.com/lisaac/luci-app-diskman/archive/v0.2.10.tar.gz | tar xfvz -
rm  -rf openwrt-packages/smartdns/
popd

# Modify default IP

#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

# Add some default settings

#\cp -rf ../lede/zzz-default-settings package/lean/default-settings/files/zzz-default-settings
curl -fsSL https://raw.githubusercontent.com/gzmud/My-action/master/lean-lede/zzz-default-settings > package/lean/default-settings/files/zzz-default-settings
