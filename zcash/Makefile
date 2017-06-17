
target_name ?= zcash

include ../Makefile.build

ZCASH_VERSION=master
ZCASH_MACHINE=$(shell ${BSP_CC} -dumpmachine)

zcash_clone:
	if [ ! -d "zcash_$(ZCASH_VERSION)" ]; then git clone -b $(ZCASH_VERSION) https://github.com/zcash/zcash.git zcash_$(ZCASH_VERSION); fi

zcash_config:
	$(call patchme,zcash_$(ZCASH_VERSION))

zcash_build:
	( cd zcash_$(ZCASH_VERSION); \
		LIBTOOLIZE=glibtoolize \
		CC=${BSP_CC} CXX=${BSP_CXX} \
		HOST=$(ZCASH_MACHINE) \
		BUILD=$(ZCASH_MACHINE) \
		./zcutil/build.sh --disable-libs; \
	)

define fix_library_paths
	install_name_tool -change "${BSPTOOLS}/o/lib/libgcc_s.1.dylib" "@executable_path/libgcc_s.1.dylib" $(1);
	install_name_tool -change "${BSPTOOLS}/o/lib/libgomp.1.dylib" "@executable_path/libgomp.1.dylib" $(1);
	install_name_tool -change "${BSPTOOLS}/o/lib/libstdc++.6.dylib" "@executable_path/libstdc++.6.dylib" $(1);
endef

zcash_install:
	rm -rf tmp
	mkdir -p tmp
	mkdir -p ${BSPINSTALL}/usr/local
	make DESTDIR=${BSPROOT}/zcash/tmp -C zcash_$(ZCASH_VERSION) install
	cp -af ${BSPROOT}/zcash/tmp${BSPROOT}/zcash/zcash_$(ZCASH_VERSION)/depends/$(ZCASH_MACHINE)/* ${BSPINSTALL}/usr/local
# unable to static link yet (-static-libgcc -static-libstdc++), fix up library paths for portability
	( cd ${BSPINSTALL}/usr/local/bin; \
		cp -a ${BSPTOOLS}/o/lib/libgcc_s.1.dylib ${BSPINSTALL}/usr/local/bin; \
		cp -a ${BSPTOOLS}/o/lib/libgomp.1.dylib ${BSPINSTALL}/usr/local/bin; \
		cp -a ${BSPTOOLS}/o/lib/libstdc++.6.dylib ${BSPINSTALL}/usr/local/bin; \
		install_name_tool -id @executable_path/libgcc_s.1.dylib libgcc_s.1.dylib; \
		install_name_tool -id @executable_path/libgomp.1.dylib libgomp.1.dylib; \
		install_name_tool -change ${BSPTOOLS}/o/lib/libgcc_s.1.dylib @executable_path/libgcc_s.1.dylib libgomp.1.dylib; \
		install_name_tool -id @executable_path/libstdc++.6.dylib libstdc++.6.dylib; \
		install_name_tool -change ${BSPTOOLS}/o/lib/libgcc_s.1.dylib @executable_path/libgcc_s.1.dylib libstdc++.6.dylib; \
	)
	$(call fix_library_paths,${BSPINSTALL}/usr/local/bin/zcashd)
	$(call fix_library_paths,${BSPINSTALL}/usr/local/bin/zcash-tx)
	$(call fix_library_paths,${BSPINSTALL}/usr/local/bin/zcash-cli)
# install zcash init script
	cp -a files/* ${BSPINSTALL}/usr/local/bin

zcash_uninstall:
	make -C zcash_$(ZCASH_VERSION) uninstall

zcash_clean:
	if [ -f "zcash_$(ZCASH_VERSION)/Makefile" ]; then make -C zcash_$(ZCASH_VERSION) distclean; fi

zcash_distclean:
	rm -rf zcash_$(ZCASH_VERSION)
