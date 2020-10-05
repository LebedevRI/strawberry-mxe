# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gst-plugins-bad
$(PKG)_WEBSITE  := https://gstreamer.freedesktop.org/modules/gst-plugins-bad.html
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.18.0
$(PKG)_CHECKSUM := f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://gstreamer.freedesktop.org/src/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := cc gstreamer gst-plugins-base gst-plugins-good libgcrypt opus faad2 faac libmpcdec chromaprint

$(PKG)_UPDATE = $(subst gstreamer/refs,gst-plugins-bad/refs,$(gstreamer_UPDATE))

define $(PKG)_BUILD
    cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' \
        -Dexamples=disabled \
        -Dtests=disabled \
        -Dgtk_doc=disabled \
        -Dexamples=disabled \
        -Dorc=enabled \
        -Daccurip=disabled \
        -Dadpcmdec=disabled \
        -Dadpcmenc=disabled \
        -Daiff=enabled \
        -Dasfmux=enabled \
        -Daudiobuffersplit=disabled \
        -Daudiofxbad=disabled \
        -Daudiolatency=disabled \
        -Daudiomixmatrix=disabled \
        -Daudiovisualizers=disabled \
        -Dautoconvert=disabled \
        -Dbayer=disabled \
        -Dcamerabin2=disabled \
        -Dcoloreffects=disabled \
        -Ddebugutils=disabled \
        -Ddvbsuboverlay=disabled \
        -Ddvdspu=disabled \
        -Dfaceoverlay=disabled \
        -Dfestival=disabled \
        -Dfieldanalysis=disabled \
        -Dfreeverb=disabled \
        -Dfrei0r=disabled \
        -Dgaudieffects=disabled \
        -Dgeometrictransform=disabled \
        -Dgdp=disabled \
        -Did3tag=disabled \
        -Dinter=disabled \
        -Dinterlace=disabled \
        -Divfparse=disabled \
        -Divtc=disabled \
        -Djp2kdecimator=disabled \
        -Djpegformat=disabled \
        -Dlibrfb=disabled \
        -Dmidi=disabled \
        -Dmpegdemux=disabled \
        -Dmpegpsmux=disabled \
        -Dmpegtsdemux=disabled \
        -Dmpegtsmux=disabled \
        -Dmxf=disabled \
        -Dnetsim=disabled \
        -Donvif=disabled \
        -Dpcapparse=disabled \
        -Dpnm=disabled \
        -Dproxy=disabled \
        -Drawparse=disabled \
        -Dremovesilence=disabled \
        -Dsdp=disabled \
        -Dsegmentclip=disabled \
        -Dsiren=disabled \
        -Dsmooth=disabled \
        -Dspeed=disabled \
        -Dsubenc=disabled \
        -Dtimecode=disabled \
        -Dvideofilters=disabled \
        -Dvideoframe_audiolevel=disabled \
        -Dvideoparsers=disabled \
        -Dvideosignal=disabled \
        -Dvmnc=disabled \
        -Dy4m=disabled \
        -Dyadif=disabled \
        -Dopencv=disabled \
        -Dwayland=disabled \
        -Dx11=disabled \
        -Daom=disabled \
        -Dandroid_media=disabled \
        -Dapple_media=disabled \
        -Dassrender=disabled \
        -Dbluez=disabled \
        -Dbs2b=disabled \
        -Dbz2=disabled \
        -Dchromaprint=enabled \
        -Dclosedcaption=disabled \
        -Dcolormanagement=disabled \
        -Dcurl=disabled \
        -Dcurl-ssh2=disabled \
        -Dd3dvideosink=disabled \
        -Ddash=disabled \
        -Ddc1394=disabled \
        -Ddecklink=disabled \
        -Ddirectfb=disabled \
        -Ddirectsound=enabled \
        -Ddtls=disabled \
        -Ddts=disabled \
        -Ddvb=disabled \
        -Dfaac=enabled \
        -Dfaad=enabled \
        -Dfbdev=disabled \
        -Dfdkaac=disabled \
        -Dflite=disabled \
        -Dfluidsynth=disabled \
        -Dgl=disabled \
        -Dgsm=disabled \
        -Dgme=disabled \
        -Dipcpipeline=disabled \
        -Diqa=disabled \
        -Dkate=disabled \
        -Dkms=disabled \
        -Dladspa=disabled \
        -Dlibde265=disabled \
        -Dlibmms=disabled \
        -Dlv2=disabled \
        -Dmodplug=disabled \
        -Dmpeg2enc=disabled \
        -Dmplex=disabled \
        -Dmsdk=disabled \
        -Dmusepack=auto \
        -Dneon=disabled \
        -Dnvdec=disabled \
        -Dnvenc=disabled \
        -Dofa=disabled \
        -Dopenal=disabled \
        -Dopenexr=disabled \
        -Dopenh264=disabled \
        -Dopenjpeg=disabled \
        -Dopenmpt=disabled \
        -Dopenni2=disabled \
        -Dopensles=disabled \
        -Dopus=enabled \
        -Dresindvd=disabled \
        -Drsvg=disabled \
        -Drtmp=disabled \
        -Dsbc=disabled \
        -Dsctp=disabled \
        -Dshm=disabled \
        -Dsmoothstreaming=disabled \
        -Dsndfile=disabled \
        -Dsoundtouch=disabled \
        -Dspandsp=disabled \
        -Dsrt=disabled \
        -Dsrtp=disabled \
        -Dteletext=disabled \
        -Dtinyalsa=disabled \
        -Dttml=disabled \
        -Duvch264=disabled \
        -Dvdpau=disabled \
        -Dvoaacenc=disabled \
        -Dvoamrwbenc=disabled \
        -Dvulkan=disabled \
        -Dwasapi=enabled \
        -Dwebp=disabled \
        -Dwebrtc=disabled \
        -Dwebrtcdsp=disabled \
        -Dwildmidi=disabled \
        -Dwinks=disabled \
        -Dwinscreencap=disabled \
        -Dx265=disabled \
        -Dzbar=disabled \
        -Dwpe=disabled \
        -Dhls=disabled \
        -Dhls-crypto=libgcrypt

    cd '$(BUILD_DIR)' && ninja
    cd '$(BUILD_DIR)' && ninja install

    # some .dlls are installed to lib - no obvious way to change
    $(if $(BUILD_SHARED),
        $(INSTALL) -d '$(PREFIX)/$(TARGET)/bin/gstreamer-1.0'
        mv -vf '$(PREFIX)/$(TARGET)/lib/gstreamer-1.0/'*.dll '$(PREFIX)/$(TARGET)/bin/gstreamer-1.0/'
    )
endef
