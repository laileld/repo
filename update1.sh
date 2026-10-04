#!/bin/bash


echo "搜索.DS_Store文件并刪除它們"
find ./ -iname ".DS_Store" -exec rm {}  \;

echo "1. 清理 .DS_Store 和 ._ 文件..."
#find . -name ".DS_Store" -type f -delete
#find . -name "._*" -type f -delete

echo "2. 重新生成 Packages 索引..."
dpkg-scanpackages -m ./debs > ./Packages

echo "3. 重新生成 Packages.bz2..."
rm -f ./Packages.bz2
bzip2 -kf Packages

echo "✅ 生成完成！"
