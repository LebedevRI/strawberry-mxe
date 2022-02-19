# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := speex
$(PKG)_WEBSITE  := https://speex.org/
$(PKG)_DESCR    := Speex: A Free Codec For Free Speech
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.0
$(PKG)_CHECKSUM := eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094
$(PKG)_SUBDIR   := speex-$($(PKG)_VERSION)
$(PKG)_FILE     := speex-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://downloads.xiph.org/releases/speex/$($(PKG)_FILE)
$(PKG)_DEPS     := cc

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://downloads.xiph.org/releases/speex/' | \
    $(SED) -n 's,.*<a href="speex-\([0-9][0-9.]*\)\.tar\.[gx]z">.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure $(MXE_CONFIGURE_OPTS)
    $(MAKE) -C '$(1)' -j '$(JOBS)' bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS= doc_DATA=
    $(MAKE) -C '$(1)' -j 1 install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS= doc_DATA=
endef
