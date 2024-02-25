#/bin/sh

rm -fr yquake2
rm -fr xatrix
rm -fr ctf
rm -fr rogue
rm -fr zaero

# get linuxdeploy-x86_64.AppImage
wget -nv -c https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage

# get source code
git clone https://github.com/yquake2/yquake2.git

# apply appimage patch and compile
cd yquake2
patch -p1 < ../patches/0001-yquake2-AppImage.patch
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release ..
make -j4
cd ..
cd ..
cp -ax yquake2/build/release/* AppDir/usr/bin

# xatrix
git clone https://github.com/yquake2/xatrix.git
cd xatrix
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
cd ..
cd ..
cp -f xatrix/build/Release/game.so AppDir/usr/bin/xatrix

# ctf
git clone https://github.com/yquake2/ctf.git
cd ctf
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
cd ..
cd ..
cp -f ctf/build/Release/game.so AppDir/usr/bin/ctf

# rogue
git clone https://github.com/yquake2/rogue.git
cd rogue
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
cd ..
cd ..
cp -f rogue/build/Release/game.so AppDir/usr/bin/rogue

# zaero
git clone https://github.com/yquake2/zaero.git
cd zaero
patch -p1 < ../patches/0002-zaero-AppImage.patch
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
cd ..
cd ..
cp -f zaero/build/Release/game.so AppDir/usr/bin/zaero

# create appimage
SIGN=1 ./linuxdeploy-x86_64.AppImage --executable AppDir/usr/bin/quake2 --desktop-file AppDir/usr/share/applications/org.yamagi.YamagiQ2.desktop --icon-file AppDir/usr/share/icons/hicolor/128x128/apps/Quake2.png --appdir AppDir --output appimage

# rename appimage
mv Yamagi_Quake_II-x86_64.AppImage Yamagi_Quake_II-8.3.0-x86_64.AppImage
chmod +x Yamagi_Quake_II-8.3.0-x86_64.AppImage
