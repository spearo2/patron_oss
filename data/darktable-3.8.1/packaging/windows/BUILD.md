To build darktable for Windows operating system you have two basic option:
A) Native compile using MSYS
B) Cross compile on Linux

## A) Native compile using MSYS2:
How to make a darktable windows installer (64 bit only):

* Install MSYS2 (instructions and prerequisites can be found on official website: https://msys2.github.io/).

* Update the base MSYS2 system until no further updates are available using: `$ pacman -Syu`

* From MSYS2 terminal, install x64 developer tools and x86_64 toolchain and git from the MSYS2 prompt:
    ```
    $ pacman -S base-devel
    $ pacman -S mingw-w64-x86_64-{toolchain,cmake,nsis}
    $ pacman -S git
    ```
* Install required libraries and dependencies:
    ```
    $ pacman -S mingw-w64-x86_64-{exiv2,lcms2,lensfun,dbus-glib,openexr,sqlite3,libxslt,libsoup,libavif,libheif,libwebp,libsecret,lua,graphicsmagick,openjpeg2,gtk3,pugixml,libexif,osm-gps-map,libgphoto2,drmingw,gettext,python3,iso-codes,python3-jsonschema,python3-setuptools}
    ```

* Install optional libraries and dependencies:
    ```
    $ pacman -S mingw-w64-x86_64-gmic
    ```
    for NG Input with midi or gamepad devices
    ```
    $ pacman -S mingw-w64-x86_64-portmidi mingw-w64-x86_64-SDL2
    ```

* Optional: Install libraries required for [testing](../../src/tests/unittests/README.md)
    ```
    $ pacman -S mingw-w64-x86_64-cmocka
    ```

* For gphoto2:
    * You need to restart the MINGW64 or MSYS terminal to have CAMLIBS and IOLIBS environment variables properly set for LIBGPHOTO are available.
    * make sure they aren't pointing into your normal windows installation in case you already have darktable installed. You can check them with:
        ```
        $ echo $CAMLIBS
        $ echo $IOLIBS
        ```
    * If you have to set them manually you can do so by setting the variables in your .bash_profile. Example:
        ```bash
        export CAMLIBS="/mingw64/lib/libgphoto2/2.5.23/"
        export IOLIBS="/mingw64/lib/libgphoto2_port/0.12.0/"
        ```

* From MINGW64 terminal, update your lensfun database:
    `lensfun-update-data`

    Also use this program to install USB driver on Windows for your camera:
    http://zadig.akeo.ie/
    When you run it, replace current Windows camera driver with WinUSB driver

* Modify your bash_profile file in your HOME directory and add the    following lines:
    ```bash
    # Added as per http://wiki.gimp.org/wiki/Hacking:Building/Windows
    export PREFIX="/mingw64"
    export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
    export PATH="$PREFIX/bin:$PATH"
    ```

* By default cmake will only use one core during the build process.  To speed things up you might wish to add a line like:
    ```bash
   	export CMAKE_BUILD_PARALLEL_LEVEL="6"
    ```
   to your .bash_profile file. This would use 6 cores.

* Execute the following command to actviate profile changes `$ . .bash_profile`

* From MINGW64 terminal, clone darktable git repository (in this example into ~/darktable):
    ```
    $ cd ~
    $ git clone git://github.com/darktable-org/darktable.git
    $ cd darktable
    $ git submodule init
    $ git submodule update
    ```

* Finally build and install darktable:
    ```
    $ mkdir build
    $ cd build
    $ cmake -G "MSYS Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/darktable ../.
    $ cmake --build .
    $ cmake --build . --target install
    ```
    After this darktable will be installed in `/opt/darktable `directory and can be started by typing `/opt/darktable/bin/darktable.exe` in MSYS2 MINGW64 terminal.

    *NOTE: If you are using the Lua scripts, build the installer and install darktable.
    The Lua scripts check the operating system and see windows and expect a windows shell when executing system commands.
    Running darktable from the MSYS2 MINGW64 terminal gives a bash shell and therefore the commands will not work.*

* For building the installer image, which will  create darktable-<VERSION>.exe installer in current build directory, use: `$ cmake --build . --target package`

    *NOTE: The package created will be optimized for the machine on which it has been built, but it could not run on other PCs with different hardware or different Windows version. If you want to create a "generic" package, change the first cmake command line as follows:*
    ```
    $ cmake -G "MSYS Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/darktable -DBINARY_PACKAGE_BUILD=ON ../.
    ```
It is now possible to build darktable on Windows using Ninja rather than Make.  This offers advantages of reduced build times for incremental builds (builds on Windows are significantly slower than with linux based systems).  To use Ninja you need to install it from an MSYS terminal with:

`$ pacman -S mingw-w64-x86_64-ninja`

Be careful as there is also a version of Ninja for MSYS and this will not work here.  Now return to a MINGW64 terminal and use this sequence
```
$ mkdir build
$ cd build
$ cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/darktable ../.
$ cmake --build .
```
If you are in a hurry you can now run darktable by executing the darktable.exe found in the build/bin folder, install in /opt/darktable as described earlier, or create an install image.  If you like experimenting you could also install clang and use that instead of gcc/g++ as the toolchain.


## B) Cross compile on Linux

*NOTE:  These instructions have not been updated for some time and are likely to need revision.*

In order to build darktable for Windows there is a chance to cross compile it
on Linux. The result is currently not particularly usable, but still, if you
are curious you could give it a try.

The tests have been done cross compiling on openSUSE. Since it's using a
virtualized installation only used for this stuff you can safely do everything
as root. It's also enough to install a server setup without X.

- Grab the openSUSE install ISO from http://software.opensuse.org/122/en
(I used the 64 Bit version).
- Install in Virtualbox.
- Prepare the system:
    ```sh
    #!/bin/sh

    # add the cross compiling repositoryies
    # regular stuff
    zypper ar http://download.opensuse.org/repositories/windows:/mingw:/win64/openSUSE_12.2/windows:mingw:win64.repo
    # extra repository for exiv2 and lensfun
    zypper ar http://download.opensuse.org/repositories/home:/sergeyopensuse:/branches:/windows:/mingw:/win64/openSUSE_12.2/home:sergeyopensuse:branches:windows:mingw:win64.repo

    # install the needed tools like cross compilers
    zypper install bash-completion mingw64-cross-gcc mingw64-cross-gcc-c++ cmake binutils git libxslt

    # install the cross compiled libraries
    zypper install mingw64-win_iconv mingw64-win_iconv-devel mingw64-gtk2 \
                mingw64-gtk2-devel mingw64-libxml2 mingw64-libxml2-devel \
                mingw64-libgomp mingw64-lensfun mingw64-lensfun-devel \
                mingw64-pthreads mingw64-pthreads-devel mingw64-librsvg \
                mingw64-librsvg-devel mingw64-libsqlite mingw64-libsqlite-devel \
                mingw64-libexiv2 mingw64-libexiv2-devel mingw64-libcurl \
                mingw64-libcurl-devel mingw64-libjpeg mingw64-libjpeg-devel \
                mingw64-libtiff mingw64-libtiff-devel mingw64-liblcms2 \
                mingw64-liblcms2-devel mingw64-libopenjpeg1 mingw64-libopenjpeg-devel \
                mingw64-GraphicsMagick mingw64-GraphicsMagick-devel mingw64-libexpat \
                mingw64-libexpat-devel mingw64-libsoup mingw64-libsoup-devel

    # the jpeg headers installed by openSUSE contain some definitions that hurt us so we have to patch these.
    # this is super ugly and needs to be redone whenever the library is updated.
    sed -e 's:^#define PACKAGE:// #define PACKAGE:g' -i /usr/x86_64-w64-mingw32/sys-root/mingw/include/jconfig.h
    ```

- Put the sources somewhere, probably by grabbing them from git: `git clone https://github.com/darktable-org/darktable.git`
- cd into the freshly cloned source tree and edit `cmake/toolchain_mingw64.cmake` if needed, it should be ok if using the virtualized openSUSE environment as described here.
- Build darktable using this script (save it as `build-win.sh`). Make sure to edit it to suit your environment, too, if needed. Again, if following these directions it should be working out of the box. Run the script from the root directory of the git clone (i.e., put it next to `build.sh`):

    ```sh
    #!/bin/sh

    # Change this to reflect your setup
    # Also edit cmake/toolchain_mingw64.cmake
    MINGW="/usr/x86_64-w64-mingw32"
    RUNTIME_PREFIX=".."


    export PATH=${MINGW}/bin:$PATH
    export CPATH=${MINGW}/include:${MINGW}/include/OpenEXR/
    export LD_LIBRARY_PATH=${MINGW}/lib
    export LD_RUN_PATH=${MINGW}/lib
    export PKG_CONFIG_LIBDIR=${MINGW}/lib/pkgconfig

    DT_SRC_DIR=`dirname "$0"`
    DT_SRC_DIR=`cd "$DT_SRC_DIR"; pwd`
    BUILD_DIR="build-win"

    cd $DT_SRC_DIR;

    INSTALL_PREFIX=$1
    if [ "$INSTALL_PREFIX" =  "" ]; then
    INSTALL_PREFIX=/opt/darktable-win/
    fi

    BUILD_TYPE=$2
    if [ "$BUILD_TYPE" =  "" ]; then
            BUILD_TYPE=RelWithDebInfo
    fi

    echo "Installing to $INSTALL_PREFIX for $BUILD_TYPE"
    echo "WARNING:"
    echo "     This is a highly experimental try to cross compile darktable for Windows!"
    echo "     It is not guaranteed to compile or do anything useful when executed!"
    echo ""

    if [ ! -d ${BUILD_DIR} ]; then
    mkdir ${BUILD_DIR}
    fi

    cd ${BUILD_DIR}

    MAKE_TASKS=1
    if [ -r /proc/cpuinfo ]; then
    MAKE_TASKS=$(grep -c "^processor" /proc/cpuinfo)
    elif [ -x /sbin/sysctl ]; then
    TMP_CORES=$(/sbin/sysctl -n hw.ncpu 2>/dev/null)
    if [ "$?" = "0" ]; then
        MAKE_TASKS=$TMP_CORES
    fi
    fi

    if [ "$(($MAKE_TASKS < 1))" -eq 1 ]; then
    MAKE_TASKS=1
    fi

    cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain_mingw64.cmake \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DCMAKE_INSTALL_LOCALEDIR=${RUNTIME_PREFIX}/share/locale \
        -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
        -DUSE_OPENCL=Off \
        -DDONT_USE_INTERNAL_LUA=On \
        .. \
    && make -j $MAKE_TASKS

    if [ $? = 0 ]; then
    echo "darktable finished building, to actually install darktable you need to type:"
    echo "# cd ${BUILD_DIR}; sudo make install"
    fi
    ```

- Last but not least: `cd build-win; make install`
- Now you have a Windows version of darktable in `/opt/darktable-win/`, which should be suited for 64 bit Windows installations. Before you can run it do `cp /usr/x86_64-w64-mingw32/sys-root/mingw/bin/*.dll /opt/darktable-win/bin/`
- Done. Copy `/opt/darktable-win/` to a Windows box, go to the bin folder and double click `darktable.exe`.

### KNOWN ISSUES:

- The current working directory has to be the bin folder when running the `.exe`. Double clicking in Explorer does that for you.
- GTK engine is not copied over/found currently, probably just a matter of putting the right DLLs into the correct places and/or setting some environment variables. We also want "wimp" in gtkrc instead of clearlooks. You can find it in `/usr/x86_64-w64-mingw32/sys-root/mingw/lib/gtk-2.0/2.10.0/engines/`
- A stupid error message about missing dbus symbols in a DLL. This is fixed in libglib already but the version used by us doesn't have it. Using newer openSUSE releases might fix this but I couldn't find lensfun and libexiv2 for them. Some day we might add our own build service to OBS so that will go away eventually.
- Moving darktable's main window freezes the application. No idea what's going on there. Since I have seen some Windows installations moving the window on startup and subsequently freezing automatically it might be impossible to run darktable for you.
- Building with openCL isn't completely done yet (links used for caching). This might change soonish, no idea if it would work in the end though.
- Importing directories didn't work in my tests (freezes), single images imported fine though, I could edit them and export them.
- Lua support doesn't compile right now since it uses select() on a file which is not supported on Windows.

Have fun with this, report back your findings.
