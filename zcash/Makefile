
target_name ?= zcash

include ../Makefile.build

ZCASH_VERSION=v2.0.1

zcash_clone:
	if [ ! -d "zcash_$(ZCASH_VERSION)" ]; then git clone -b $(ZCASH_VERSION) https://github.com/zcash/zcash.git zcash_$(ZCASH_VERSION); fi

zcash_config:
	@true

zcash_build:
	( cd zcash_$(ZCASH_VERSION); \
		CFLAGS="" CXXFLAGS="" LIBTOOLIZE=glibtoolize ./zcutil/build.sh -j ${BSPJOB}; \
	)

zcash_install:
	rm -rf tmp
	mkdir -p tmp
	mkdir -p ${BSPINSTALL}/usr/local
	make DESTDIR=${BSPROOT}/zcash/tmp -C zcash_$(ZCASH_VERSION) install
	cp -af ${BSPROOT}/zcash/tmp${BSPROOT}/zcash/zcash_$(ZCASH_VERSION)/depends/*/* ${BSPINSTALL}/usr/local
# install zcash init script
	cp -a files/* ${BSPINSTALL}/usr/local/bin

zcash_uninstall:
	make -C zcash_$(ZCASH_VERSION) uninstall

zcash_clean:
	if [ -f "zcash_$(ZCASH_VERSION)/Makefile" ]; then make -C zcash_$(ZCASH_VERSION) distclean; fi

zcash_distclean:
	rm -rf zcash_$(ZCASH_VERSION)
