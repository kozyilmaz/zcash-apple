
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

subdir-y := tools
subdir-y += bdb
subdir-y += gmp
subdir-y += boost
subdir-y += libsodium
subdir-y += libsnark
subdir-y += libzmq
subdir-y += libevent
subdir-y += openssl
subdir-y += librustzcash
subdir-y += googletest
subdir-y += zcash

boost_depends-y = \
	gmp

libsnark_depends-y = \
	gmp \
	libsodium

zcash_depends-y = \
	bdb \
	gmp \
	boost \
	libsodium \
	libsnark \
	libzmq \
	libevent \
	openssl \
	librustzcash \
	googletest

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
