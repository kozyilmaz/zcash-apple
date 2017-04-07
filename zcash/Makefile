
target_name ?= zcash

include ../Makefile.build

ZCASH_VERSION=v1.0.8

zcash_clone:
	if [ ! -d "zcash_$(ZCASH_VERSION)" ]; then git clone -b $(ZCASH_VERSION) https://github.com/zcash/zcash.git zcash_$(ZCASH_VERSION); fi

zcash_config:
	$(call patchme,zcash_$(ZCASH_VERSION))
	if [ ! -f zcash_$(ZCASH_VERSION)/configure ]; then (cd zcash_$(ZCASH_VERSION); ./autogen.sh); fi
	( cd zcash_$(ZCASH_VERSION); \
		CC=${BSP_CC} CXX=${BSP_CXX} \
		CPPFLAGS="-I${BSPROOTFS}/include -I${BSPROOTFS}/include/libsnark" \
		CXXFLAGS="-I${BSPROOTFS}/include -I${BSPROOTFS}/include/libsnark -fwrapv -fno-strict-aliasing -Werror -g" \
		LDFLAGS="-L${BSPROOTFS}/lib" \
		ZMQ_CFLAGS="-I${BSPROOTFS}/include" ZMQ_LIBS="-L${BSPROOTFS}/lib -lzmq" \
		SSL_CFLAGS="-I${BSPROOTFS}/include" SSL_LIBS="-L${BSPROOTFS}/lib -lssl" \
		CRYPTO_CFLAGS="-I${BSPROOTFS}/include" CRYPTO_LIBS="-L${BSPROOTFS}/lib -lcrypto" \
		EVENT_CFLAGS="-I${BSPROOTFS}/include" EVENT_LIBS="-L${BSPROOTFS}/lib -levent" \
		EVENT_PTHREADS_CFLAGS="-I${BSPROOTFS}/include" EVENT_PTHREADS_LIBS="-L${BSPROOTFS}/lib -levent_pthreads" \
		./configure --with-boost=${BSPROOTFS} --without-libs --disable-tests; \
	)

zcash_build:
	make -C zcash_$(ZCASH_VERSION) -j ${BSPJOB}

define fix_library_paths
	install_name_tool -change "${BSPTOOLS}/o/lib/libgcc_s.1.dylib" "@executable_path/libgcc_s.1.dylib" $(1);
	install_name_tool -change "${BSPTOOLS}/o/lib/libgomp.1.dylib" "@executable_path/libgomp.1.dylib" $(1);
	install_name_tool -change "${BSPTOOLS}/o/lib/libstdc++.6.dylib" "@executable_path/libstdc++.6.dylib" $(1);
endef

zcash_install:
	mkdir -p ${BSPINSTALL}
	make DESTDIR=${BSPINSTALL} -C zcash_$(ZCASH_VERSION) install
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
