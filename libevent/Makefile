
target_name ?= libevent

include ../Makefile.build

LIBEVENT_VERSION=2.1.8-stable

libevent_clone:
	if [ ! -f "libevent-$(LIBEVENT_VERSION).tar.gz" ]; then curl -OL https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)/libevent-$(LIBEVENT_VERSION).tar.gz; fi;
	if [ ! -d "libevent-$(LIBEVENT_VERSION)" ]; then tar xvf libevent-$(LIBEVENT_VERSION).tar.gz; fi

libevent_config:
	( cd libevent-$(LIBEVENT_VERSION); \
		CC=gcc-6.3.0 CXX=g++-6.3.0 ./configure --prefix=${BSPROOTFS} \
		--enable-static --disable-shared --disable-openssl --disable-libevent-regress --disable-debug-mode; \
	)

libevent_build:
	make -C libevent-$(LIBEVENT_VERSION) -j ${BSPJOB}

libevent_install:
	make -C libevent-$(LIBEVENT_VERSION) install

libevent_uninstall:
	make -C libevent-$(LIBEVENT_VERSION) uninstall

libevent_clean:
	if [ -f "libevent-$(LIBEVENT_VERSION)/Makefile" ]; then make -C libevent-$(LIBEVENT_VERSION) distclean; fi

libevent_distclean:
	rm -rf libevent-$(LIBEVENT_VERSION)

