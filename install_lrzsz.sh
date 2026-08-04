#!/bin/bash
# ============================================
# 脚本名称: install_lrzsz_simple.sh
# 功能描述: 在当前目录编译安装 lrzsz
# 使用方法: 在 lrzsz-0.12.20 目录下执行
# ============================================
cd lrzsz-0.12.20
set -e

echo "开始编译安装 lrzsz..."

# 配置
./configure --prefix=/usr/local

# 编译（使用多核加速）
make -j$(nproc 2>/dev/null || echo 1)

# 安装
sudo make install

# 创建软链接
sudo ln -sf /usr/local/bin/lrz /usr/local/bin/rz
sudo ln -sf /usr/local/bin/lsz /usr/local/bin/sz

echo "安装完成！"

# 验证
echo "验证安装："
which rz && rz --version 2>&1 | head -1
