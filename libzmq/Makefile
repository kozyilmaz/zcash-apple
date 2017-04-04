
target_name ?= libzmq

include ../Makefile.build

LIBZMQ_VERSION=4.2.2

libzmq_clone:
	if [ ! -f "libzmq-$(LIBSODIUM_VERSION).tar.gz" ]; then curl -OL https://github.com/zeromq/libzmq/releases/download/v$(LIBZMQ_VERSION)/zeromq-$(LIBZMQ_VERSION).tar.gz; fi;
	if [ ! -d "libzmq-$(LIBSODIUM_VERSION)" ]; then tar xvf libzmq-$(LIBSODIUM_VERSION).tar.gz; fi

libzmq_config:
	( cd libzmq-$(LIBSODIUM_VERSION); CC=${BSP_CC} CXX=${BSP_CXX} ./configure --prefix=${BSPROOTFS} --enable-static --without-documentation --disable-shared --disable-curve; )

libzmq_build:
	make -C libzmq-$(LIBSODIUM_VERSION) -j ${BSPJOB}

libzmq_install:
	make -C libzmq-$(LIBSODIUM_VERSION) install

libzmq_uninstall:
	make -C libzmq-$(LIBSODIUM_VERSION) uninstall

libzmq_clean:
	if [ -f "libzmq-$(LIBSODIUM_VERSION)/Makefile" ]; then make -C libzmq-$(LIBSODIUM_VERSION) distclean; fi

libzmq_distclean:
	rm -rf libzmq-$(LIBSODIUM_VERSION)
	rm -rf libzmq-$(LIBSODIUM_VERSION).tar.gz
