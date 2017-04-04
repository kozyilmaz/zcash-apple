
target_name ?= miniupnpc

include ../Makefile.build

MINIUPNPC_VERSION=2.0.20161216

miniupnpc_clone:
	if [ ! -f "miniupnpc-$(MINIUPNPC_VERSION).tar.gz" ]; then curl -OL http://miniupnp.free.fr/files/miniupnpc-$(MINIUPNPC_VERSION).tar.gz; fi;
	if [ ! -d "miniupnpc-$(MINIUPNPC_VERSION)" ]; then tar xvf miniupnpc-$(MINIUPNPC_VERSION).tar.gz; fi

miniupnpc_config:
	$(call patchme,miniupnpc-$(MINIUPNPC_VERSION))
	( cd miniupnpc-$(MINIUPNPC_VERSION); \
		CC=${BSP_CC} CXX=${BSP_CXX} cmake -DCMAKE_INSTALL_PREFIX=${BSPROOTFS} -DUPNPC_BUILD_STATIC=TRUE -DUPNPC_BUILD_SHARED=FALSE . ; \
	)

miniupnpc_build:
	make -C miniupnpc-$(MINIUPNPC_VERSION) -j ${BSPJOB}

miniupnpc_install:
	make -C miniupnpc-$(MINIUPNPC_VERSION) install

miniupnpc_uninstall:
	make -C miniupnpc-$(MINIUPNPC_VERSION) uninstall

miniupnpc_clean:
	if [ -f "miniupnpc-$(MINIUPNPC_VERSION)/Makefile" ]; then make -C miniupnpc-$(MINIUPNPC_VERSION) clean; fi

miniupnpc_distclean:
	rm -rf miniupnpc-$(MINIUPNPC_VERSION)
	rm -rf miniupnpc-$(MINIUPNPC_VERSION).tar.gz
