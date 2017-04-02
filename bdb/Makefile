
target_name ?= bdb

include ../Makefile.build

BDB_VERSION=6.2.23

bdb_clone:
	if [ ! -f "bdb-$(BDB_VERSION).tar.gz" ]; then curl -OL http://download.oracle.com/berkeley-db/db-$(BDB_VERSION).tar.gz; fi;
	if [ ! -d "bdb-$(BDB_VERSION)" ]; then tar xvf bdb-$(BDB_VERSION).tar.gz; fi

bdb_config:
	( cd bdb-$(BDB_VERSION); \
		CC=gcc-6.3.0 CXX=g++-6.3.0 ./configure --prefix=${BSPROOTFS} \
		--enable-static --disable-shared --enable-cxx --disable-replication \
	)

bdb_build:
	make -C bdb-$(BDB_VERSION) -j ${BSPJOB}

bdb_install:
	make -C bdb-$(BDB_VERSION) install

bdb_uninstall:
	make -C bdb-$(BDB_VERSION) uninstall

bdb_clean:
	if [ -f "bdb-$(BDB_VERSION)/Makefile" ]; then make -C bdb-$(BDB_VERSION) distclean; fi

bdb_distclean:
	rm -rf bdb-$(BDB_VERSION)

