
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

subdir-y := tools
subdir-y += bdb
subdir-y += gmp
subdir-y += boost
subdir-y += libzmq
subdir-y += libsodium
subdir-y += libsnark
subdir-y += libevent
subdir-y += librustzcash
subdir-y += openssl
subdir-y += miniupnpc
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
	libzmq \
	libsodium \
	libsnark \
	libevent \
	librustzcash \
	openssl \
	miniupnpc \
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
