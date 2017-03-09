
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


include Makefile.lib
