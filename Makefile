
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

# essentials
subdir-y = \
	autoconf \
	automake \
	pkgconfig \
	libtool

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

pkgconfig_depends-y = \
	automake

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
