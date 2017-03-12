
ifeq ($(BSPTOOLS),)
    $(error You must first export $$BSPTOOLS for install dir and add it to $$PATH)
endif

# essentials
subdir-y = \
	m4 \
	autoconf \
	automake \
	libtool \
	pkgconfig

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

autoconf_depends-y = \
	m4

automake_depends-y = \
	autoconf

libtool_depends-y = \
	automake

pkgconfig_depends-y = \
	libtool

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
