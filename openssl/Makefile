
target_name ?= openssl

include ../Makefile.build

OPENSSL_VERSION=1.1.0e

openssl_clone:
	if [ ! -f "openssl-$(OPENSSL_VERSION).tar.gz" ]; then curl -OL https://www.openssl.org/source/openssl-$(OPENSSL_VERSION).tar.gz; fi;
	if [ ! -d "openssl-$(OPENSSL_VERSION)" ]; then tar xvf openssl-$(OPENSSL_VERSION).tar.gz; fi

openssl_config:
	( cd openssl-$(OPENSSL_VERSION); \
		CC=${BSP_CC} CXX=${BSP_CXX} ./config --prefix=${BSPROOTFS} --openssldir=/System/Library/OpenSSL no-shared \
		no-afalgeng no-asm no-async no-bf no-blake2 no-camellia no-capieng no-cast no-chacha no-cmac no-cms no-comp \
		no-crypto-mdebug no-crypto-mdebug-backtrace no-ct no-des no-dgram no-dsa no-dso no-dtls no-dtls1 no-dtls1-method \
		no-dynamic-engine no-ec2m no-ec_nistp_64_gcc_128 no-egd no-engine no-err no-gost no-heartbeats no-idea no-md2 \
		no-md4 no-mdc2 no-multiblock no-nextprotoneg no-ocb no-ocsp no-poly1305 no-posix-io no-psk no-rc2 no-rc4 no-rc5 \
		no-rdrand no-rfc3779 no-rmd160 no-scrypt no-sctp no-seed no-shared no-sock no-srp no-srtp no-ssl no-ssl3 \
		no-ssl3-method no-ssl-trace no-stdio no-tls no-tls1 no-tls1-method no-ts no-ui no-unit-test no-weak-ssl-ciphers \
		no-whirlpool no-zlib no-zlib-dynamic -DPURIFY \
	)

openssl_build:
	make -C openssl-$(OPENSSL_VERSION) -j ${BSPJOB}

openssl_install:
	make -C openssl-$(OPENSSL_VERSION) install_sw

openssl_uninstall:
	make -C openssl-$(OPENSSL_VERSION) uninstall_sw

openssl_clean:
	if [ -f "openssl-$(OPENSSL_VERSION)/Makefile" ]; then make -C openssl-$(OPENSSL_VERSION) distclean; fi

openssl_distclean:
	rm -rf openssl-$(OPENSSL_VERSION)

