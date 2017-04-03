
target_name ?= googletest

include ../Makefile.build

GOOGLETEST_VERSION=1.8.0

googletest_clone:
	if [ ! -f "release-$(GOOGLETEST_VERSION).tar.gz" ]; then curl -OL https://github.com/google/googletest/archive/release-$(GOOGLETEST_VERSION).tar.gz; fi;
	if [ ! -d "googletest-release-$(GOOGLETEST_VERSION)" ]; then tar xzf release-$(GOOGLETEST_VERSION).tar.gz; fi

googletest_config:
	@true

googletest_build:
	CC=gcc-6.3.0 CXX=g++-6.3.0 make -C googletest-release-$(GOOGLETEST_VERSION)/googletest/make CXXFLAGS=-fPIC gtest.a
	CC=gcc-6.3.0 CXX=g++-6.3.0 make -C googletest-release-$(GOOGLETEST_VERSION)/googlemock/make GTEST_DIR=${BSPROOTFS} CXXFLAGS='-fPIC' gmock-all.o

googletest_install:
	if [ -f "googletest-release-$(GOOGLETEST_VERSION)/googletest/make/gtest.a" ]; then \
		cp googletest-release-$(GOOGLETEST_VERSION)/googletest/make/gtest.a ${BSPROOTFS}/lib/libgtest.a; \
	fi
	if [ -d "googletest-release-$(GOOGLETEST_VERSION)/googletest/include" ]; then \
		cp -a googletest-release-$(GOOGLETEST_VERSION)/googletest/include/* ${BSPROOTFS}/include; \
	fi
	if [ -f "googletest-release-$(GOOGLETEST_VERSION)/googlemock/make/gmock-all.o" ]; then \
		cp googletest-release-$(GOOGLETEST_VERSION)/googlemock/make/gmock-all.o ${BSPROOTFS}/lib/libgmock.a; \
	fi
	if [ -d "googletest-release-$(GOOGLETEST_VERSION)/googlemock/include" ]; then \
		cp -a googletest-release-$(GOOGLETEST_VERSION)/googlemock/include/* ${BSPROOTFS}/include; \
	fi

googletest_uninstall:
	rm -rf ${BSPROOTFS}/lib/libgtest.a
	rm -rf ${BSPROOTFS}/include/gtest
	rm -rf ${BSPROOTFS}/lib/libgmock.a
	rm -rf ${BSPROOTFS}/include/gmock

googletest_clean:
	CC=gcc-6.3.0 CXX=g++-6.3.0 make -C googletest-release-$(GOOGLETEST_VERSION)/googletest/make clean
	CC=gcc-6.3.0 CXX=g++-6.3.0 make -C googletest-release-$(GOOGLETEST_VERSION)/googlemock/make clean

googletest_distclean:
	rm -rf googletest-release-$(GOOGLETEST_VERSION)
	rm -rf release-$(GOOGLETEST_VERSION).tar.gz
