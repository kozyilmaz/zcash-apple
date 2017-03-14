
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

# essentials
subdir-y = \
	autoconf \
	automake \
	libtool \
	pkgconfig \
	coreutils

# optionals
subdir-y += \
	flock \
	kconfig

# gcc
subdir-y += \
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

#cmake_depends-y = \
#	pkgconfig

coreutils_depends-y = \
	pkgconfig

#openmp_depends-y = \
#	pkgconfig

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
