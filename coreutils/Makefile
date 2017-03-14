
target_name ?= coreutils

include ../Makefile.build

COREUTILS_VERSION="8.26"

coreutils_clone:
	if [ ! -f "coreutils-$(COREUTILS_VERSION).tar.xz" ]; then curl -OL https://ftp.gnu.org/gnu/coreutils/coreutils-$(COREUTILS_VERSION).tar.xz; fi;
	if [ ! -d "coreutils-$(COREUTILS_VERSION)" ]; then tar xzf coreutils-$(COREUTILS_VERSION).tar.xz; fi

coreutils_config:
	( cd coreutils-$(COREUTILS_VERSION); ./configure --prefix=${BSPTOOLS}/o --program-prefix=g; )

coreutils_build:
	make -C coreutils-$(COREUTILS_VERSION) -j ${BSPJOB}

coreutils_install:
	if [ -f "coreutils-$(COREUTILS_VERSION)/src/md5sum" ]; then cp coreutils-$(COREUTILS_VERSION)/src/md5sum ${BSPTOOLS}/o/bin/md5sum; fi
	if [ -f "coreutils-$(COREUTILS_VERSION)/src/md5sum" ]; then cp coreutils-$(COREUTILS_VERSION)/src/sha256sum ${BSPTOOLS}/o/bin/sha256sum; fi
	if [ -f "coreutils-$(COREUTILS_VERSION)/src/readlink" ]; then cp coreutils-$(COREUTILS_VERSION)/src/readlink ${BSPTOOLS}/o/bin/greadlink; fi

coreutils_uninstall:
	rm -rf ${BSPTOOLS}/o/bin/md5sum
	rm -rf ${BSPTOOLS}/o/bin/sha256sum
	rm -rf ${BSPTOOLS}/o/bin/greadlink

coreutils_clean:
	if [ -f "coreutils-$(COREUTILS_VERSION)/Makefile" ]; then make -C coreutils-$(COREUTILS_VERSION) distclean; fi

coreutils_distclean:
	rm -rf coreutils-$(COREUTILS_VERSION)
	rm -rf coreutils-$(COREUTILS_VERSION).tar.xz
