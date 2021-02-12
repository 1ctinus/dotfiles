APP_NAME="Aseprite"

if [ "$1" = "info" ]; then
  echo 'Aseprite - Animated sprite editor & pixel art tool';
  echo ''
  echo 'More Info'
elif [ "$1" = "status" ]; then
  if which aseprite > /dev/null; then
    echo Installed
  else
    echo Available
  fi
elif [ "$1" = "install" ]; then
  echo Install $APP_NAME
  if ! sudo true; then exit; fi
  cd /tmp
  # --- START INSTALL ---
  sudo apt-get install -y g++ cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev build-essential freeglut3-dev libfontconfig-dev libfreetype6-dev libgif-dev libglu1-mesa-dev libharfbuzz-dev libicu-dev libjpeg-dev libpng-dev libwebp-dev

  wget https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-Linux-Release-x64.zip
  mkdir skia
  cd skia
  unzip ../Skia-Linux-Release-x64.zip
  rm ../Skia-Linux-Release-x64.zip -f
  cd ..

  git clone --recursive https://github.com/aseprite/aseprite.git
  cd aseprite
  mkdir build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DLAF_BACKEND=skia \
    -DSKIA_DIR=/tmp/skia \
    -DSKIA_LIBRARY_DIR=/tmp/skia/out/Release-x64/ \
    -DSKIA_LIBRARY=/tmp/skia/out/Release-x64/libskia.a \
    -G Ninja \
    ..
  ninja aseprite

  sudo mv /tmp/aseprite/build/bin /usr/share/aseprite
  sudo ln -s /usr/share/aseprite/aseprite /usr/bin/aseprite
  # ---  END INSTALL  ---
elif [ "$1" = "remove" ]; then
  echo Remove $APP_NAME
  if ! sudo true; then exit; fi
  # --- START REMOVE ---

  # ---  END REMOVE  ---
else
  echo "Usage:" $0 "install|remove|info|status"
  echo
  echo "Installer for" $($0 info | head -1)
fi