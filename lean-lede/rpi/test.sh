#!/bin/bash
# 本脚本用于构建修改.config文件环境
# 默认已安装buildroot

git clone https://github.com/coolsnowwolf/lede
pushd lede
./scripts/feeds update -a
./scripts/feeds install -a
curl -fsSL https://raw.githubusercontent.com/gzmud/My-action/master/lean-lede/rpi/.config >.config
bash <(curl -fsSL https://raw.githubusercontent.com/gzmud/My-action/master/lean-lede/diy.sh)
make defconfig
./scripts/diffconfig.sh >../gzconfig
popd