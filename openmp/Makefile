
target_name ?= openmp

include ../Makefile.build

OPENMP_VERSION="4.0.0"

openmp_clone:
	if [ ! -f "openmp-$(OPENMP_VERSION).tar.xz" ]; then curl -OL http://releases.llvm.org/$(OPENMP_VERSION)/openmp-$(OPENMP_VERSION).src.tar.xz; fi;
	if [ ! -d "openmp-$(OPENMP_VERSION).src" ]; then tar xzf openmp-$(OPENMP_VERSION).src.tar.xz; fi

openmp_config:
	( cd openmp-$(OPENMP_VERSION).src; ./configure --prefix=${BSPTOOLS}/o2; )

openmp_build:
	make -C openmp-$(OPENMP_VERSION).src -j ${BSPJOB}

openmp_install:
	make -C openmp-$(OPENMP_VERSION).src -j ${BSPJOB} install

openmp_uninstall:
	@true

openmp_clean:
	if [ -f "openmp-$(OPENMP_VERSION).src/Makefile" ]; then make -C openmp-$(OPENMP_VERSION).src distclean; fi

openmp_distclean:
	rm -rf openmp-$(OPENMP_VERSION).src
	rm -rf openmp-$(OPENMP_VERSION).src.tar.xz
