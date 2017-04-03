
target_name ?= libsodium

include ../Makefile.build

LIBSODIUM_VERSION=1.0.12

libsodium_clone:
	if [ ! -f "libsodium-$(LIBSODIUM_VERSION).tar.gz" ]; then curl -OL https://download.libsodium.org/libsodium/releases/libsodium-$(LIBSODIUM_VERSION).tar.gz; fi;
	if [ ! -d "libsodium-$(LIBSODIUM_VERSION)" ]; then tar xvf libsodium-$(LIBSODIUM_VERSION).tar.gz; fi

libsodium_config:
	( cd libsodium-$(LIBSODIUM_VERSION); CC=gcc-6.3.0 CXX=g++-6.3.0 ./configure --prefix=${BSPROOTFS} --enable-static --disable-shared; )

libsodium_build:
	make -C libsodium-$(LIBSODIUM_VERSION) -j ${BSPJOB}

libsodium_install:
	make -C libsodium-$(LIBSODIUM_VERSION) install

libsodium_uninstall:
	make -C libsodium-$(LIBSODIUM_VERSION) uninstall

libsodium_clean:
	if [ -f "libsodium-$(LIBSODIUM_VERSION)/Makefile" ]; then make -C libsodium-$(LIBSODIUM_VERSION) distclean; fi

libsodium_distclean:
	rm -rf libsodium-$(LIBSODIUM_VERSION)
	rm -rf libsodium-$(LIBSODIUM_VERSION).tar.bz2
