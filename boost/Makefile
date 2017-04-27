
target_name ?= boost

include ../Makefile.build

BOOST_VERSION=1_63_0

boost_clone:
	if [ ! -f "boost_$(BOOST_VERSION).tar.bz2" ]; then curl -OL https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_$(BOOST_VERSION).tar.bz2; fi
	if [ ! -d "boost_$(BOOST_VERSION)" ]; then tar xvf boost_$(BOOST_VERSION).tar.bz2; fi

boost_config:
	$(call patchme,boost_$(BOOST_VERSION))
	if [ ! -f boost_$(BOOST_VERSION)/tools/build/src/user-config.jam ]; then \
		echo "using darwin : 6.3 : ${BSPTOOLS}/o/bin/${BSP_CXX} : <cxxflags>"-fvisibility=hidden" : ; " >> boost_$(BOOST_VERSION)/tools/build/src/user-config.jam; \
	fi
	( cd boost_$(BOOST_VERSION); ./bootstrap.sh --prefix=${BSPROOTFS} --without-icu --with-libraries=chrono,filesystem,program_options,system,thread,test; )

boost_build:
	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release --layout=tagged --build-type=complete threading=multi link=static -sNO_BZIP2=1 -sNO_ZLIB=1 runtime-link=shared toolset=darwin-6.3; )

boost_install:
	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release --layout=tagged --build-type=complete threading=multi link=static -sNO_BZIP2=1 -sNO_ZLIB=1 runtime-link=shared toolset=darwin-6.3 install; )

boost_uninstall:
	@true

boost_clean:
	if [ -f "boost_$(BOOST_VERSION)/Makefile" ]; then make -C boost_$(BOOST_VERSION) distclean; fi

boost_distclean:
	rm -rf boost_$(BOOST_VERSION)
