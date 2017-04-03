
target_name ?= zcash

include ../Makefile.build

ZCASH_VERSION=v1.0.8

zcash_clone:
	if [ ! -d "zcash_$(ZCASH_VERSION)" ]; then git clone -b $(ZCASH_VERSION) https://github.com/zcash/zcash.git zcash_$(ZCASH_VERSION); fi

zcash_config:
	$(call patchme,zcash_$(ZCASH_VERSION))
	if [ ! -f zcash_$(ZCASH_VERSION)/configure ]; then (cd zcash_$(ZCASH_VERSION); ./autogen.sh); fi
	( cd zcash_$(ZCASH_VERSION); \
		CC=gcc-6.3.0 \
		CXX=g++-6.3.0 \
		CFLAGS="-I${BSPROOTFS}/include -I${BSPROOTFS}/include/libsnark" \
		CXXFLAGS="-I${BSPROOTFS}/include -I${BSPROOTFS}/include/libsnark -fwrapv -fno-strict-aliasing -Werror -g -Wl,-undefined -Wl,dynamic_lookup" \
		CPPFLAGS="-I${BSPROOTFS}/include -I${BSPROOTFS}/include/libsnark" \
		LDFLAGS="-L${BSPROOTFS}/lib" \
		SSL_CFLAGS="-I${BSPROOTFS}/include" SSL_LIBS="-L${BSPROOTFS}/lib -lssl" \
		CRYPTO_CFLAGS="-I${BSPROOTFS}/include" CRYPTO_LIBS="-L${BSPROOTFS}/lib -lcrypto" \
		EVENT_CFLAGS="-I${BSPROOTFS}/include" EVENT_LIBS="-L${BSPROOTFS}/lib -levent" \
		EVENT_PTHREADS_CFLAGS="-I${BSPROOTFS}/include" EVENT_PTHREADS_LIBS="-L${BSPROOTFS}/lib -levent_pthreads" \
		./configure --prefix=${BSPROOTFS} --disable-wallet --with-boost=${BSPROOTFS}; \
	)

zcash_build:
	make -C zcash_$(ZCASH_VERSION) -j ${BSPJOB}

zcash_install:
	make -C zcash_$(ZCASH_VERSION) install

zcash_uninstall:
	make -C zcash_$(ZCASH_VERSION) uninstall

zcash_clean:
	if [ -f "zcash_$(ZCASH_VERSION)/Makefile" ]; then make -C zcash_$(ZCASH_VERSION) distclean; fi

zcash_distclean:
	rm -rf zcash_$(ZCASH_VERSION)
