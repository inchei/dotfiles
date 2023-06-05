@echo off
echo ##################start##################
::chcp 936
::setlocal enabledelayedexpansion
::color 0b

del /s /q mobi8
rd /s /q mobi8
del /s /q HDImages
rd /s /q HDImages

rem 复制 目录中的文件 到当前文件夹
rem for /r . %%a in (*) do if exist "%%a" copy /y "%%a" .


rem 移动 目录中的文件 到当前文件夹
for /r . %%a in (*) do if exist "%%a" move /y "%%a" .

del /s /q mobi7
rd /s /q mobi7

echo ################## end ##################
echo on
