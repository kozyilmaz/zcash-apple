
target_name ?= libsnark

include ../Makefile.build

LIBSNARK_VERSION=master
LIBSNARK_COMMIT=9ada3f84ab484c57b2247c2f41091fd6a0916573

libsnark_clone:
	if [ ! -d "libsnark-$(LIBSNARK_VERSION)" ]; then git clone -b $(LIBSNARK_VERSION) https://github.com/zcash/libsnark.git libsnark-$(LIBSNARK_VERSION); fi
ifneq ($(LIBSNARK_COMMIT),)
	if [ ! -d "libsnark-$(LIBSNARK_VERSION)" ]; then cd libsnark-$(LIBSNARK_VERSION); git checkout $(LIBSNARK_COMMIT); fi
endif

libsnark_config:
	$(call patchme,libsnark-$(LIBSNARK_VERSION))

libsnark_build:
	CC=gcc-6.3.0 CXX=g++-6.3.0 \
		CXXFLAGS="-fPIC -DBINARY_OUTPUT -DNO_PT_COMPRESSION=1" \
		make -C libsnark-$(LIBSNARK_VERSION) lib DEPINST=${BSPROOTFS} PREFIX=${BSPROOTFS} \
		CURVE=ALT_BN128 MULTICORE=1 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 NO_SUPERCOP=1 \
		FEATUREFLAGS=-DMONTGOMERY_OUTPUT OPTFLAGS="-O2 -march=x86-64"

libsnark_install:
	CC=gcc-6.3.0 CXX=g++-6.3.0 \
		CXXFLAGS="-fPIC -DBINARY_OUTPUT -DNO_PT_COMPRESSION=1" \
		make -C libsnark-$(LIBSNARK_VERSION) install DEPINST=${BSPROOTFS} PREFIX=${BSPROOTFS} \
		CURVE=ALT_BN128 MULTICORE=1 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 NO_SUPERCOP=1 \
		FEATUREFLAGS=-DMONTGOMERY_OUTPUT OPTFLAGS="-O2 -march=x86-64"

libsnark_uninstall:
	make -C libsnark-$(LIBSNARK_VERSION) uninstall

libsnark_clean:
	make -C libsnark-$(LIBSNARK_VERSION) clean-all

libsnark_distclean:
	rm -rf libsnark-$(LIBSNARK_VERSION)
