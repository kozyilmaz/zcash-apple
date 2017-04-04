
target_name ?= libzmq

include ../Makefile.build

LIBZMQ_VERSION=4.2.2

libzmq_clone:
	if [ ! -f "zeromq-$(LIBZMQ_VERSION).tar.gz" ]; then curl -OL https://github.com/zeromq/libzmq/releases/download/v$(LIBZMQ_VERSION)/zeromq-$(LIBZMQ_VERSION).tar.gz; fi;
	if [ ! -d "zeromq-$(LIBZMQ_VERSION)" ]; then tar xvf zeromq-$(LIBZMQ_VERSION).tar.gz; fi

libzmq_config:
	( cd zeromq-$(LIBZMQ_VERSION); CC=${BSP_CC} CXX=${BSP_CXX} ./configure --prefix=${BSPROOTFS} --enable-static --without-documentation --disable-shared --disable-curve; )

libzmq_build:
	make -C zeromq-$(LIBZMQ_VERSION) -j ${BSPJOB}

libzmq_install:
	make -C zeromq-$(LIBZMQ_VERSION) install

libzmq_uninstall:
	make -C zeromq-$(LIBZMQ_VERSION) uninstall

libzmq_clean:
	if [ -f "zeromq-$(LIBZMQ_VERSION)/Makefile" ]; then make -C zeromq-$(LIBZMQ_VERSION) distclean; fi

libzmq_distclean:
	rm -rf zeromq-$(LIBZMQ_VERSION)
	rm -rf zeromq-$(LIBZMQ_VERSION).tar.gz
