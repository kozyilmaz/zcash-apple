
target_name ?= flock

include ../Makefile.build

FLOCK_VERSION="0.2.3"

flock_clone:
	if [ ! -d "flock-$(FLOCK_VERSION)" ]; then git clone -b v$(FLOCK_VERSION) https://github.com/kozyilmaz/flock.git flock-$(FLOCK_VERSION); fi

flock_config:
	( cd flock-$(FLOCK_VERSION); ./autogen.sh; ./configure --prefix=${BSPTOOLS}/o )

flock_build:
	make -C flock-$(FLOCK_VERSION) flock

flock_install:
	if [ -f "flock-$(FLOCK_VERSION)/flock" ]; then cp flock-$(FLOCK_VERSION)/flock ${BSPTOOLS}/o/bin; fi

flock_uninstall:
	rm -rf ${BSPTOOLS}/o/bin/flock

flock_clean:
	if [ -f "flock-$(FLOCK_VERSION)/Makefile" ]; then make -C flock-$(FLOCK_VERSION) distclean; fi

flock_distclean:
	rm -rf flock-$(FLOCK_VERSION)
