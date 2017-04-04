
target_name ?= bdb

include ../Makefile.build

BDB_VERSION=6.2.23

bdb_clone:
	if [ ! -f "db-$(BDB_VERSION).tar.gz" ]; then curl -OL http://download.oracle.com/berkeley-db/db-$(BDB_VERSION).tar.gz; fi;
	if [ ! -d "db-$(BDB_VERSION)" ]; then tar xvf db-$(BDB_VERSION).tar.gz; fi

bdb_config:
	( cd db-$(BDB_VERSION)/build_unix; \
		CC=${BSP_CC} CXX=${BSP_CXX} CFLAGS="" CXXFLAGS="" \
		../dist/configure --prefix=${BSPROOTFS} \
		--enable-static --disable-shared --enable-cxx --disable-replication \
	)

bdb_build:
	make -C db-$(BDB_VERSION)/build_unix -j ${BSPJOB} libdb_cxx-6.2.a libdb-6.2.a

bdb_install:
	make -C db-$(BDB_VERSION)/build_unix install_lib install_include

bdb_uninstall:
	make -C db-$(BDB_VERSION)/build_unix uninstall_lib uninstall_include

bdb_clean:
	if [ -f "db-$(BDB_VERSION)/build_unix/Makefile" ]; then make -C db-$(BDB_VERSION)/build_unix distclean; fi

bdb_distclean:
	rm -rf db-$(BDB_VERSION)

