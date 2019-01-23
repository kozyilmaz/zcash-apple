
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

ifeq ($(uname_S), Linux)
TOOLS_ENABLE_ESSENTIALS ?= y
TOOLS_ENABLE_CMAKE      ?= n
TOOLS_ENABLE_GNUTOOLS   ?= n
TOOLS_ENABLE_KCONFIG    ?= n
TOOLS_ENABLE_GCC        ?= n
else
TOOLS_ENABLE_ESSENTIALS ?= y
TOOLS_ENABLE_CMAKE      ?= n
TOOLS_ENABLE_GNUTOOLS   ?= n
TOOLS_ENABLE_KCONFIG    ?= n
TOOLS_ENABLE_GCC        ?= n
endif

# essentials
subdir-${TOOLS_ENABLE_ESSENTIALS} = \
	autoconf \
	automake \
	libtool \
	pkgconfig

# cmake (on macOS)
subdir-${TOOLS_ENABLE_CMAKE} += \
	cmake

# gnu utils (on macOS)
subdir-${TOOLS_ENABLE_GNUTOOLS} += \
	coreutils

# kconfig
subdir-${TOOLS_ENABLE_KCONFIG} += \
	kconfig

# gcc (on macOS)
subdir-${TOOLS_ENABLE_GCC} += \
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

cmake_depends-y = \
	pkgconfig

coreutils_depends-y = \
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
