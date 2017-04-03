
target_name ?= googletest

include ../Makefile.build

GOOGLETEST_VERSION=1.7.0

googletest_clone:
	if [ ! -f "googletest-$(GOOGLETEST_VERSION).tar.gz" ]; then curl -OL https://github.com/google/googletest/archive/googletest-$(GOOGLETEST_VERSION).tar.gz; fi;
	if [ ! -d "googletest-$(GOOGLETEST_VERSION)" ]; then tar xzf googletest-$(GOOGLETEST_VERSION).tar.gz; fi

googletest_config:
	( cd googletest-$(GOOGLETEST_VERSION); \
		CC=gcc-6.3.0 CXX=g++-6.3.0 CFLAGS="" CXXFLAGS="" CPPFLAGS="" \
		./configure --prefix=${BSPROOTFS} --enable-cxx --enable-static --disable-shared; \
	)

googletest_build:
	make -C googletest-$(GOOGLETEST_VERSION) -j ${BSPJOB}

googletest_install:
	make -C googletest-$(GOOGLETEST_VERSION) install

googletest_uninstall:
	make -C googletest-$(GOOGLETEST_VERSION) uninstall

googletest_clean:
	if [ -f "googletest-$(GOOGLETEST_VERSION)/Makefile" ]; then make -C googletest-$(GOOGLETEST_VERSION) distclean; fi

googletest_distclean:
	rm -rf googletest-$(GOOGLETEST_VERSION)
	rm -rf googletest-$(GOOGLETEST_VERSION).tar.gz
