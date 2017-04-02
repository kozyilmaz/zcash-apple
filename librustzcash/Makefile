
target_name ?= librustzcash

include ../Makefile.build

LIBRUSTZCASH_VERSION=master
LIBRUSTZCASH_COMMIT=91348647a86201a9482ad4ad68398152dc3d635e

librustzcash_clone:
	if [ ! -d "librustzcash-$(LIBRUSTZCASH_VERSION)" ]; then git clone -b $(LIBRUSTZCASH_VERSION) https://github.com/zcash/librustzcash.git librustzcash-$(LIBRUSTZCASH_VERSION); fi
ifneq ($(LIBRUSTZCASH_COMMIT),)
	if [ -d "librustzcash-$(LIBRUSTZCASH_VERSION)" ]; then cd librustzcash-$(LIBRUSTZCASH_VERSION); git checkout $(LIBRUSTZCASH_COMMIT); fi
endif

librustzcash_config:
	@true

librustzcash_build:
	( cd librustzcash-$(LIBRUSTZCASH_VERSION); cargo build --release; )

librustzcash_install:
	if [ -f "librustzcash-$(LIBRUSTZCASH_VERSION)/target/release/librustzcash.a" ]; then \
		cp librustzcash-$(LIBRUSTZCASH_VERSION)/target/release/librustzcash.a ${BSPROOTFS}/lib; \
	fi
	if [ -f "librustzcash-$(LIBRUSTZCASH_VERSION)/include/librustzcash.h" ]; then \
		cp librustzcash-$(LIBRUSTZCASH_VERSION)/include/librustzcash.h ${BSPROOTFS}/include; \
	fi

librustzcash_uninstall:
	rm -rf ${BSPROOTFS}/lib/librustzcash.a
	rm -rf ${BSPROOTFS}/include/librustzcash.h

librustzcash_clean:
	@true

librustzcash_distclean:
	rm -rf librustzcash-$(LIBRUSTZCASH_VERSION)
