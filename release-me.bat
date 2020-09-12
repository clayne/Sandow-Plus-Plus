:: This file compresses all mod files for a release version.
:: It also compresses a backup copy for a particular version of
:: the mod.
:: Read all comments before using this.
::
:: This script was made to automatically include library files needed
:: by this mod for being able to work at release.
:: Download that library from:
:: https://github.com/CarlosLeyvaAyala/DM-SkyrimSE-Library.git
::
:: It will also exclude external files needed to build the project
:: but which is not a so good idea to include them at release, like
:: "SKI_WidgetBase" and "SKI_WidgetManager".
::
:: You only need to care about this file if you inherited this project
:: and need to release it. Otherwise, ignore it.
:: It isn't strictly necessary to use this, but it will surely
:: save you a lot of time.
::
:: You also need to download 7-zip for this to work.

ECHO OFF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Mod variables
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /p ModVersion="Input the mod version you are about to release: "

:: DON'T CHANGE THESE
SET modName="Sandow Plus Plus"
SET modEsp="SandowPP.esp"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: You need to update ALL these variables so they point towards
:: valid paths in your own computer.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 7 zip path
SET zipExe="C:\Program Files\7-Zip\7z"
:: Path to my library you downloaded from github at
:: https://github.com/CarlosLeyvaAyala/DM-SkyrimSE-Library.git
SET baseLib="E:\Skyrim SE\MO2\mods\DM-SkyrimSE-Library\"
SET lib=%baseLib%"scripts\"
:: This points towards a dir github will ignore. It saves backups
:: for newly released versions
SET backupDir="_ignore\_backups"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: External libraries required by this mod
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SET req1="DM_Utils.pex"
SET req2="DM_MeterWidgetScript.pex"
:: Whole folder with Lua scripts
SET req3=%baseLib%"SKSE\"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Files needed to compile, but not distributable.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: These are included in this github repo, but they are
:: already distributed by SkyUI.
SET exc1="SKI_*"
:: Unneeded developing helpers
SET exc2="__*" "*.md"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Create release zip (*.7z) file
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: See https://sevenzip.osdn.jp/chm/cmdline/index.htm
SET comp=-mx9
%zipExe% d %modName%.7z
%zipExe% a -t7z %modName%.7z interface scripts %modEsp% %lib%\%req1% %lib%\%req2% %req3% %comp%
%zipExe% a -t7z %modName%.7z SKSE -spf2 %comp%

:: Put libraries in the correct folder
%zipExe% rn %modName%.7z %req1% scripts\%req1% %req2% scripts\%req2% %comp%

:: Delete undesired files from zip
%zipExe% d %modName%.7z scripts\source %exc1% %exc2% -r -bb1 %comp%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Copy backup
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
COPY %modName%.7z %backupDir%\%modName%" "%ModVersion%.7z

PAUSE
