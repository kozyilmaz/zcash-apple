
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

#subdir-y := tools
subdir-y += gmp
subdir-y += boost
subdir-y += libsodium
subdir-y += libsnark
subdir-y += zcash

#gmp_depends-y = \
#	tools

boost_depends-y = \
	gmp

libsnark_depends-y = \
	gmp \
	libsodium

zcash_depends-y = \
	libsnark

include Makefile.lib

clone:
	@true

config:
	@true

build:
	@true

install:
	@true

uninstall:
	@true

clean:
	@true

distclean: clean
	@true
