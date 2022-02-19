# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := pango
$(PKG)_WEBSITE  := https://pango.gnome.org/
$(PKG)_DESCR    := Library for laying out and rendering of text
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.50.4
$(PKG)_CHECKSUM := f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162
$(PKG)_SUBDIR   := pango-$($(PKG)_VERSION)
$(PKG)_FILE     := pango-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/pango/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc glib fontconfig freetype cairo harfbuzz fribidi json-glib $(BUILD)~ninja

define $(PKG)_UPDATE
    $(call MXE_GET_GH_TAGS,GNOME/pango) | \
    grep -v '\([0-9]\+\.\)\{2\}9[0-9]' | \
    $(SORT) -Vr | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(SOURCE_DIR)' && $(TARGET)-meson -Dintrospection=disabled '$(BUILD_DIR)'
    cd '$(BUILD_DIR)' && ninja
    cd '$(BUILD_DIR)' && ninja install
endef
