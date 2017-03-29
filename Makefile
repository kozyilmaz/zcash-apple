
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

ifeq ($(uname_S), Linux)
ENABLE_ESSENTIALS ?= n
ENABLE_OBJCONV    ?= n
ENABLE_FASM       ?= n
ENABLE_CMAKE      ?= n
ENABLE_GNUTOOLS   ?= n
ENABLE_FLOCK      ?= n
ENABLE_KCONFIG    ?= y
ENABLE_GCC        ?= n
else
ENABLE_ESSENTIALS ?= y
ENABLE_OBJCONV    ?= y
ENABLE_FASM       ?= y
ENABLE_CMAKE      ?= y
ENABLE_GNUTOOLS   ?= y
ENABLE_FLOCK      ?= y
ENABLE_KCONFIG    ?= y
ENABLE_GCC        ?= y
endif

# essentials
subdir-${ENABLE_ESSENTIALS} = \
	autoconf \
	automake \
	libtool \
	pkgconfig

# objconv (on macOS)
subdir-${ENABLE_OBJCONV} += \
	objconv

# fasm (on macOS)
subdir-${ENABLE_FASM} += \
	fasm

# cmake (on macOS)
subdir-${ENABLE_CMAKE} += \
	cmake

# gnu utils (on macOS)
subdir-${ENABLE_GNUTOOLS} += \
	coreutils

# flock (on macOS)
subdir-${ENABLE_FLOCK} += \
	flock

# kconfig
subdir-${ENABLE_KCONFIG} += \
	kconfig

# gcc (on macOS)
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
	libtool

objconv_depends-y = \
	pkgconfig

fasm_depends-y = \
	objconv

cmake_depends-y = \
	pkgconfig

coreutils_depends-y = \
	pkgconfig

flock_depends-y = \
	pkgconfig

kconfig_depends-y = \
	pkgconfig

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
