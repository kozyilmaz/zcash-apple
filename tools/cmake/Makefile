
target_name ?= cmake

include ../Makefile.build

CMAKE_MAJOR=3
CMAKE_MINOR=12
CMAKE_MICRO=3
CMAKE_VERSION=$(CMAKE_MAJOR).$(CMAKE_MINOR).$(CMAKE_MICRO)

cmake_clone:
	if [ ! -f "cmake-$(CMAKE_VERSION).tar.gz" ]; then curl -OL https://cmake.org/files/v$(CMAKE_MAJOR).$(CMAKE_MINOR)/cmake-$(CMAKE_VERSION).tar.gz; fi;
	if [ ! -d "cmake-$(CMAKE_VERSION)" ]; then tar xzf cmake-$(CMAKE_VERSION).tar.gz; fi

cmake_config:
	( cd cmake-$(CMAKE_VERSION); CFLAGS="" CXXFLAGS="" ./bootstrap --parallel=${BSPJOB} --prefix=${BSPTOOLS} --no-qt-gui; )

cmake_build:
	make -C cmake-$(CMAKE_VERSION) -j ${BSPJOB}

cmake_install:
	${BSPSUDO} make -C cmake-$(CMAKE_VERSION) -j ${BSPJOB} install

cmake_uninstall:
	${BSPSUDO} make -C cmake-$(CMAKE_VERSION) uninstall

cmake_clean:
	if [ -f "cmake-$(CMAKE_VERSION)/Makefile" ]; then make -C cmake-$(CMAKE_VERSION) clean; fi

cmake_distclean:
	rm -rf cmake-$(CMAKE_VERSION)
	rm -rf cmake-$(CMAKE_VERSION).tar.gz
