
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

ifeq ($(uname_S), Linux)
ENABLE_ESSENTIALS ?= n
ENABLE_GNUTOOLS   ?= n
ENABLE_FLOCK      ?= n
ENABLE_KCONFIG    ?= y
ENABLE_GCC        ?= n
else
ENABLE_ESSENTIALS ?= y
ENABLE_GNUTOOLS   ?= y
ENABLE_FLOCK      ?= y
ENABLE_KCONFIG    ?= y
ENABLE_GCC        ?= n
endif

# essentials
subdir-${ENABLE_ESSENTIALS} = \
	autoconf \
	automake \
	libtool \
	pkgconfig

# flock (needed on macOS: zcash)
subdir-${ENABLE_GNUTOOLS} += \
	coreutils

# flock (needed on macOS: zcash)
subdir-${ENABLE_FLOCK} += \
	flock

# kconfig
subdir-${ENABLE_KCONFIG} += \
	kconfig

# gcc (needed on macOS)
subdir-${ENABLE_GCC} += \
	gmp \
	mpfr \
	mpc \
	isl \
	gnugcc

automake_depends-y = \
	autoconf

libtool_depends-y = \
	automake

pkgconfig_depends-y = \
	automake

cmake_depends-y = \
	pkgconfig

coreutils_depends-y = \
	pkgconfig

flock_depends-y = \
	pkgconfig

kconfig_depends-y = \
	pkgconfig

# gcc dependencies
gmp_depends-y = \
	pkgconfig

mpfr_depends-y = \
	gmp

mpc_depends-y = \
	mpfr

isl_depends-y = \
	mpc

gnugcc_depends-y = \
	isl


include Makefile.lib
