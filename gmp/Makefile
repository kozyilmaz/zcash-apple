
target_name ?= gmp

include ../Makefile.build

GMP_VERSION="6.1.2"

gmp_clone:
	if [ ! -f "gmp-$(GMP_VERSION).tar.bz2" ]; then curl -OL http://ftp.gnu.org/gnu/gmp/gmp-$(GMP_VERSION).tar.bz2; fi;
	if [ ! -d "gmp-$(GMP_VERSION)" ]; then tar xzf gmp-$(GMP_VERSION).tar.bz2; fi

gmp_config:
	( cd gmp-$(GMP_VERSION); CC=gcc-6.3.0 CXX=g++-6.3.0 ./configure --prefix=${BSPROOTFS} --enable-cxx --enable-static --disable-shared; )

gmp_build:
	make -C gmp-$(GMP_VERSION) -j ${BSPJOB}

gmp_install:
	make -C gmp-$(GMP_VERSION) install

gmp_uninstall:
	make -C gmp-$(GMP_VERSION) uninstall

gmp_clean:
	if [ -f "gmp-$(GMP_VERSION)/Makefile" ]; then make -C gmp-$(GMP_VERSION) distclean; fi

gmp_distclean:
	rm -rf gmp-$(GMP_VERSION)
	rm -rf gmp-$(GMP_VERSION).tar.bz2
