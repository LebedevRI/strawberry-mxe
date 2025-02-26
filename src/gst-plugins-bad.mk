# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gst-plugins-bad
$(PKG)_WEBSITE  := https://gstreamer.freedesktop.org/modules/gst-plugins-bad.html
$(PKG)_DESCR    := Open Source Multimedia Framework
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.22.4
$(PKG)_CHECKSUM := eaaf53224565eaabd505ca39c6d5769719b45795cf532ce1ceb60e1b2ebe99ac
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://gstreamer.freedesktop.org/src/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := cc gstreamer gst-plugins-base gst-plugins-good libgcrypt libxml2 libopus faad2 faac musepack chromaprint libopenmpt fdk-aac libgme libbs2b

$(PKG)_UPDATE = $(gstreamer_UPDATE)

define $(PKG)_BUILD
    cd '$(SOURCE_DIR)' && '$(TARGET)-meson' \
        --buildtype='$(MESON_BUILD_TYPE)' \
        -Dexamples=disabled \
        -Dtests=disabled \
        -Dexamples=disabled \
        -Dgpl=enabled \
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
        -Dcodecalpha=disabled \
        -Dcodectimestamper=disabled \
        -Dcoloreffects=disabled \
        -Ddebugutils=disabled \
        -Ddvbsubenc=disabled \
        -Ddvbsuboverlay=disabled \
        -Ddvdspu=disabled \
        -Dfaceoverlay=disabled \
        -Dfestival=disabled \
        -Dfieldanalysis=disabled \
        -Dfreeverb=disabled \
        -Dfrei0r=disabled \
        -Dgaudieffects=disabled \
        -Dgdp=disabled \
        -Dgeometrictransform=disabled \
        -Did3tag=enabled \
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
        -Dqroverlay=disabled \
        -Dqsv=disabled \
        -Drawparse=disabled \
        -Dremovesilence=enabled \
        -Drist=disabled \
        -Drtmp2=disabled \
        -Drtp=disabled \
        -Dsdp=disabled \
        -Dsegmentclip=disabled \
        -Dsiren=disabled \
        -Dsmooth=disabled \
        -Dspeed=disabled \
        -Dsubenc=disabled \
        -Dswitchbin=disabled \
        -Dtimecode=disabled \
        -Dvideofilters=disabled \
        -Dvideoframe_audiolevel=disabled \
        -Dvideoparsers=disabled \
        -Dvideosignal=disabled \
        -Dvmnc=disabled \
        -Dy4m=disabled \
        -Dopencv=disabled \
        -Dwayland=disabled \
        -Dx11=disabled \
        -Daes=enabled \
        -Daom=disabled \
        -Davtp=disabled \
        -Dandroidmedia=disabled \
        -Dapplemedia=disabled \
        -Dasio=disabled \
        -Dassrender=disabled \
        -Dbluez=enabled \
        -Dbs2b=enabled \
        -Dbz2=disabled \
        -Dchromaprint=enabled \
        -Dclosedcaption=disabled \
        -Dcolormanagement=disabled \
        -Dcurl=disabled \
        -Dcurl-ssh2=disabled \
        -Dd3dvideosink=disabled \
        -Dd3d11=disabled \
        -Ddash=enabled \
        -Ddc1394=disabled \
        -Ddecklink=disabled \
        -Ddirectfb=disabled \
        -Ddirectsound=enabled \
        -Ddirectshow=disabled \
        -Ddtls=disabled \
        -Ddts=disabled \
        -Ddvb=disabled \
        -Dfaac=enabled \
        -Dfaad=enabled \
        -Dfbdev=disabled \
        -Dfdkaac=enabled \
        -Dflite=disabled \
        -Dfluidsynth=disabled \
        -Dgl=disabled \
        -Dgme=enabled \
        -Dgs=disabled \
        -Dgsm=disabled \
        -Dgtk3=disabled \
        -Dipcpipeline=disabled \
        -Diqa=disabled \
        -Dkate=disabled \
        -Dkms=disabled \
        -Dladspa=disabled \
        -Dldac=disabled \
        -Dlibde265=disabled \
        -Dopenaptx=disabled \
        -Dlv2=disabled \
        -Dmediafoundation=disabled \
        -Dmicrodns=disabled \
        -Dmodplug=disabled \
        -Dmpeg2enc=disabled \
        -Dmplex=disabled \
        -Dmsdk=disabled \
        -Dmusepack=enabled \
        -Dneon=disabled \
        -Dnvcodec=disabled \
        -Donnx=disabled \
        -Dopenal=disabled \
        -Dopenexr=disabled \
        -Dopenh264=disabled \
        -Dopenjpeg=disabled \
        -Dopenmpt=enabled \
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
        -Dsvthevcenc=disabled \
        -Dteletext=disabled \
        -Dtinyalsa=disabled \
        -Dtranscode=disabled \
        -Dttml=disabled \
        -Duvch264=disabled \
        -Dva=disabled \
        -Dvoaacenc=disabled \
        -Dvoamrwbenc=disabled \
        -Dvulkan=disabled \
        -Dwasapi=enabled \
        -Dwasapi2=auto \
        -Dwebp=disabled \
        -Dwebrtc=disabled \
        -Dwebrtcdsp=disabled \
        -Dwildmidi=disabled \
        -Dwic=disabled \
        -Dwin32ipc=disabled \
        -Dwinks=disabled \
        -Dwinscreencap=disabled \
        -Dx265=disabled \
        -Dzbar=disabled \
        -Dzxing=disabled \
        -Dwpe=disabled \
        -Dmagicleap=disabled \
        -Dv4l2codecs=disabled \
        -Disac=disabled \
        -Dhls=enabled \
        -Dhls-crypto=libgcrypt \
        '$(BUILD_DIR)'

    cd '$(BUILD_DIR)' && ninja
    cd '$(BUILD_DIR)' && ninja install

    # some .dlls are installed to lib - no obvious way to change
    $(if $(BUILD_SHARED),
        $(INSTALL) -d '$(PREFIX)/$(TARGET)/bin/gstreamer-1.0'
        mv -vf '$(PREFIX)/$(TARGET)/lib/gstreamer-1.0/'*.dll '$(PREFIX)/$(TARGET)/bin/gstreamer-1.0/'
    )
endef
