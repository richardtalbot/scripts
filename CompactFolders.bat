@echo off
REM Script for Windows 10+ by Rick Talbot. Public Domain. Use at own risk.
REM This script compacts files in four directories that tend to bloat due to Windows Updates and Windows Installer.
REM The first pass sets the compact flag on the folders and all subfolders. This will cause any future files to be compressed via the default NTFS method.
REM The second pass compacts existing files using the xpress16k method, which has higher compression ratio than the default.
REM This script is typically only one once.

echo "First Pass..."

cd "%SystemRoot%\SoftwareDistribution"
for /D /r %%G IN (*) DO compact /c "%%G"

cd "%SystemRoot%\Downloaded Program Files"
for /D /r %%G IN (*) DO compact /c "%%G"

cd "%SystemRoot%\Downloaded Installations"
for /D /r %%G IN (*) DO compact /c "%%G"

cd "%SystemRoot%\Installer"
for /D /r %%G IN (*) DO compact /c "%%G"

echo "Second Pass..."

compact /EXE:xpress16k /c /s /a /i "%SystemRoot%\SoftwareDistribution\*"
compact /EXE:xpress16k /c /s /a /i "%SystemRoot%\Downloaded Program Files\*"
compact /EXE:xpress16k /c /s /a /i "%SystemRoot%\Downloaded Installations\*"
compact /EXE:xpress16k /c /s /a /i "%SystemRoot%\Installer\*"




