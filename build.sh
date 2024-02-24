#/bin/sh

rm -fr yquake2

# get linuxdeploy-x86_64.AppImage
wget -nv -c https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage

# get source code
git clone https://github.com/yquake2/yquake2.git

# apply appimage patch and compile
cd yquake2
patch -p1 < ../patches/0001-yquake2-AppImage.patch
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
make -j4

# remove temp stuff
cd ..
cd ..

# copy files
cp -ax yquake2/build/release/* AppDir/usr/bin

# create appimage
SIGN=1 ./linuxdeploy-x86_64.AppImage --executable AppDir/usr/bin/quake2 --desktop-file AppDir/usr/share/applications/org.yamagi.YamagiQ2.desktop --icon-file AppDir/usr/share/icons/hicolor/128x128/apps/Quake2.png --appdir AppDir --output appimage

# rename appimage
mv Yamagi_Quake_II-x86_64.AppImage Yamagi_Quake_II-8.3.0-x86_64.AppImage
chmod +x Yamagi_Quake_II-8.3.0-x86_64.AppImage
