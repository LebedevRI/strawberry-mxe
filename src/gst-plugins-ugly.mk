#This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gst-plugins-ugly
$(PKG)_WEBSITE  := https://gstreamer.freedesktop.org/modules/gst-plugins-ugly.html
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.16.2
$(PKG)_CHECKSUM := 5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://gstreamer.freedesktop.org/src/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := cc gstreamer gst-plugins-base lame libcdio

$(PKG)_UPDATE = $(subst gstreamer/refs,gst-plugins-ugly/refs,$(gstreamer_UPDATE))

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && \
        CFLAGS="${CFLAGS} -DGST_USE_UNSTABLE_API=1" '$(SOURCE_DIR)/configure' $(MXE_CONFIGURE_OPTS) \
        --disable-debug \
        --disable-examples \
        --disable-opengl \
        --disable-dvdlpcmdec \
        --disable-dvdsub \
        --disable-xingmux \
        --disable-realmediav \
        --disable-a52dec \
        --disable-amrnb \
        --disable-amrwb \
        --disable-dvdread \
        --disable-mpeg2dec \
        --disable-sidplay \
        --disable-x264 \
        --enable-cdio \
        --enable-asfdemux

    $(MAKE) -C '$(BUILD_DIR)' -j $(JOBS)
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # some .dlls are installed to lib - no obvious way to change
    $(if $(BUILD_SHARED),
        $(INSTALL) -d '$(PREFIX)/$(TARGET)/bin/gstreamer-1.0'
        mv -vf '$(PREFIX)/$(TARGET)/lib/gstreamer-1.0/'*.dll '$(PREFIX)/$(TARGET)/bin/gstreamer-1.0/'
    )
endef
