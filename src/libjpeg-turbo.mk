# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libjpeg-turbo
$(PKG)_WEBSITE  := https://libjpeg-turbo.org/
$(PKG)_DESCR    := Free library for JPEG image compression
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.5.1
$(PKG)_CHECKSUM := 2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf8486844ca22207bf
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://$(SOURCEFORGE_MIRROR)/project/$(PKG)/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := cc $(BUILD)~nasm

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://sourceforge.net/projects/libjpeg-turbo/files/' | \
    $(SED) -n 's,.*/projects/.*/\([0-9][^"%]*\)/".*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    $(TARGET)-cmake -S '$(SOURCE_DIR)' -B '$(BUILD_DIR)' \
        -DCMAKE_BUILD_TYPE='$(MXE_BUILD_TYPE)' \
        -DENABLE_SHARED=$(CMAKE_SHARED_BOOL) \
        -DENABLE_STATIC=$(CMAKE_STATIC_BOOL) \
        -DCMAKE_INSTALL_BINDIR='$(PREFIX)/$(TARGET)/bin/$(PKG)' \
        -DCMAKE_INSTALL_INCLUDEDIR='$(PREFIX)/$(TARGET)/include/$(PKG)' \
        -DCMAKE_INSTALL_LIBDIR='$(PREFIX)/$(TARGET)/lib/$(PKG)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    '$(TARGET)-gcc' \
        -W -Wall -Werror -ansi -pedantic \
        '$(TOP_DIR)/src/jpeg-test.c' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
        `'$(TARGET)-pkg-config' '$(PREFIX)/$(TARGET)/lib/$(PKG)/pkgconfig/libjpeg.pc' --cflags --libs`
endef
