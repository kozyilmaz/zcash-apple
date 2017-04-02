
target_name ?= librustzcash

include ../Makefile.build

LIBRUSTZCASH_VERSION=master
LIBRUSTZCASH_COMMIT=9ada3f84ab484c57b2247c2f41091fd6a0916573

librustzcash_clone:
	if [ ! -d "librustzcash_$(LIBRUSTZCASH_VERSION)" ]; then git clone https://github.com/zcash/libsnark.git librustzcash_$(LIBRUSTZCASH_VERSION); fi
ifneq ($(LIBRUSTZCASH_COMMIT),)
	if [ ! -d "librustzcash_$(LIBRUSTZCASH_VERSION)" ]; then cd librustzcash_$(LIBRUSTZCASH_VERSION); git checkout $(LIBRUSTZCASH_COMMIT); fi
endif

librustzcash_config:
	@true

librustzcash_build:
	( cd librustzcash-$(LIBRUSTZCASH_VERSION); cargo build --release; )

librustzcash_install:
	@true

librustzcash_uninstall:
	make -C librustzcash_$(LIBRUSTZCASH_VERSION) uninstall

librustzcash_clean:
	make -C librustzcash_$(LIBRUSTZCASH_VERSION) clean-all

librustzcash_distclean:
	rm -rf librustzcash_$(LIBRUSTZCASH_VERSION)
