
target_name ?= libsnark

include ../Makefile.build

LIBSNARK_VERSION=9ada3f84ab484c57b2247c2f41091fd6a0916573

libsnark_clone:
	if [ ! -d "libsnark_$(LIBSNARK_VERSION)" ]; then git clone -b $(LIBSNARK_VERSION) https://github.com/zcash/libsnark.git libsnark_$(LIBSNARK_VERSION); fi

libsnark_config:
	$(call patchme,libsnark_$(LIBSNARK_VERSION))

libsnark_build:
	CFLAGS="-I${BSPROOTFS}/include" CXXFLAGS="-I${BSPROOTFS}/include" LDFLAGS="-L${BSPROOTFS}/lib" make -C libsnark_$(LIBSNARK_VERSION) lib NO_SUPERCOP=1 CURVE=ALT_BN128 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 PREFIX=${BSPROOTFS}

libsnark_install:
	CFLAGS="-I${BSPROOTFS}/include" CXXFLAGS="-I${BSPROOTFS}/include" LDFLAGS="-L${BSPROOTFS}/lib" make -C libsnark_$(LIBSNARK_VERSION) lib NO_SUPERCOP=1 CURVE=ALT_BN128 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 PREFIX=${BSPROOTFS} -j ${BSPJOB} install

libsnark_uninstall:
	make -C libsnark_$(LIBSNARK_VERSION) uninstall

libsnark_clean:
	make -C libsnark_$(LIBSNARK_VERSION) clean-all

libsnark_distclean:
	rm -rf libsnark_$(LIBSNARK_VERSION)
