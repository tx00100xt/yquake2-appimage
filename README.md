# yquake2-appimage

[![Build status](https://github.com/tx00100xt/yquake2-appimage/actions/workflows/cibuild.yml/badge.svg)](https://github.com/tx00100xt//yquake2-appimage/actions/)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/tx00100xt/yquake2-appimage)](https://github.com/tx00100xt/yquake2-appimage/releases/tag/8.3.0)
[![Github downloads](https://img.shields.io/github/downloads/tx00100xt/yquake2-appimage/total.svg?logo=github&logoColor=white&style=flat-square&color=E75776)](https://github.com/tx00100xt/yquake2-appimage/releases/)

<h1 align="center">
  <img src="https://raw.githubusercontent.com/tx00100xt/yquake2-appimage/main/AppDir/usr/share/icons/hicolor/128x128/apps/Quake2.png" alt="AppImage for Yamagi Quake II">
  <br/>
</h1>
<p align="center"><b>This is a AppImage for Yamagi Quake II</b>
  
## Why?
AppImage is a format for distributing portable software on Linux without needing superuser permissions to install the application  It tries also to allow Linux distribution-agnostic binary software deployment for application developers, also called Upstream packaging. Released first in 2004 under the name klik, it was continuously developed, then renamed in 2011 to PortableLinuxApps and later in 2013 to AppImage. [wikipedia](https://en.wikipedia.org/wiki/AppImage)

## Upstream
All credits here:  
https://www.yamagi.org/quake2/  
https://github.com/yquake2/yquake2

## Running
Download the AppImages from the release page! Then, make the AppImage an executable by entering `chmod +x $FILE` in a terminal or by right-clicking the file then selecting "Properties" then "Permissions", and checking the executable checkbox. Then, double-`click the AppImage to run **Yamagi Quake II**. To launch mods, use the game menu or enter in the terminal:
```
./Yamagi_Quake_II-8.3.0-x86_64.AppImage +set game <mod name>
```
AppImage include xatrix rogue zaero ctf mods.

## Game data
This package only provides the engine, you need a valid copy of the (proprietary) game data to launch the game.
When you first start the game, you will be asked to place your game data along the following paths:
```
    ~/.yq2/baseq2
    ~/.yq2/xatrix
    ~/.yq2/rogue
    ~/.yq2/ctf
    ~/.yq2/zaero
```
You can place game data in these paths before starting the game. Then the game will start immediately.

## Verify
All AppImages are signed, including those compiled using GitHub Action.  
You can check the application signature by running the command in the terminal:
```
./Yamagi_Quake_II-8.3.0-x86_64.AppImage --appimage-signature
```
Get keyid and verify:  
```
./Yamagi_Quake_II-20240226-8.3.0-x86_64.AppImage --appimage-signature | gpg --list-packets | grep keyid

```
```
:signature packet: algo 1, keyid CDC41982C027BAAA
```
```
gpg --recv-keys --keyserver keyserver.ubuntu.com  CDC41982C027BAAA

```

### Build status
|CI|Platform|Compiler|Configurations|Platforms|Status|
|---|---|---|---|---|---|
|GitHub Actions|Ubuntu|GCC|Release|x64|![GitHub Actions Build Status](https://github.com/tx00100xt/yquake2-appimage/actions/workflows/cibuild.yml/badge.svg)

You can download a the automatically build based on the latest commit.  
To do this, go to the [Actions tab], select the top workflows, and then Artifacts.

[Actions tab]: https://github.com/tx00100xt//yquake2-appimage/actions "Download Artifacts"
