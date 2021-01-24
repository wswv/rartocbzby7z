@echo off
:: 切换当前编码方式为 UTF-8，处理命令行窗口标题乱码问题
chcp 65001
title 批量压缩当前目录下个文件到各自压缩包
:: 切换回默认 GBK 编码，处理命令行输出乱码问题
chcp 936
echo ---------- START -------------


:: 实现二：遍历当前目录下（不含子目录）的文件夹进行压缩, 压缩成与当前文件夹同名的 cbz 格式文件 , 最后压缩文件存放在目录下新建的 cbz 文件夹（可自定义，特换自己想要的文件夹名称）下（如想以目录形式打包，可以参考此方式）
:: for /d %%F in (*) do (echo "%%~nF" && "C:\Program Files\7-Zip\7z" a -tzip "../%%~nF.cbz" * -mx=1 )

for /d %%F in (*) do (echo "%%~nF" && "C:\Program Files\7-Zip\7z.exe" a -tzip ".\cbz\%%~nF.cbz" "%%F" )



echo ----------  END  -------------
pause
