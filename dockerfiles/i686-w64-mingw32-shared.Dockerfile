FROM opensuse/leap:15.3

RUN zypper -n ar -c -f -n 'repo-devel-tools-building' https://download.opensuse.org/repositories/devel:/tools:/building/openSUSE_Leap_15.3/ repo-devel-tools-building
RUN zypper -n ar -c -f -n 'repo-nsis' https://download.opensuse.org/repositories/windows:/mingw:/win32/openSUSE_Leap_15.3/ repo-nsis

RUN zypper -n --gpg-auto-import-keys ref
RUN zypper -n --gpg-auto-import-keys up -l -y

RUN zypper -n --gpg-auto-import-keys install \
    glibc glibc-extra glibc-locale glibc-i18ndata glibc-32bit gcc10 gcc10-c++ \
    shadow git make cmake libtool pkg-config autoconf automake makeinfo meson ninja intltool \
    which patch wget curl gperf tar gzip bzip2 xz p7zip p7zip-full lzip zip unzip \
    gettext-tools gtk-doc ruby scons bison flex diffutils orc \
    linux-glibc-devel glibc-devel file-devel libopenssl-devel libffi-devel gdk-pixbuf-devel \
    python-base python3-base python3-setuptools python3-Mako \
    mingw32-cross-nsis

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 1
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 1

RUN mkdir -p /tmp/lockedlist && wget https://nsis.sourceforge.io/mediawiki/images/d/d3/LockedList.zip --directory-prefix=/tmp/lockedlist
RUN cd /tmp/lockedlist && unzip /tmp/lockedlist/LockedList.zip
RUN cp /tmp/lockedlist/Plugins/x86-unicode/LockedList.dll /usr/share/nsis/Plugins/x86-unicode/
RUN cp /tmp/lockedlist/Plugins/LockedList64.dll /usr/share/nsis/Plugins/

RUN mkdir -p /usr/src
RUN cd /usr/src/ && git clone https://github.com/strawberrymusicplayer/strawberry-mxe
RUN sed -i 's/MXE_TARGETS := .*/MXE_TARGETS := i686-w64-mingw32.shared/g' /usr/src/strawberry-mxe/settings.mk
RUN cd /usr/src/strawberry-mxe && make -j4 zlib
RUN cd /usr/src/strawberry-mxe && make -j4
