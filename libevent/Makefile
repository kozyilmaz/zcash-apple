
target_name ?= libevent

include ../Makefile.build

LIBEVENT_VERSION=2.1.8

libevent_clone:
	if [ ! -f "libevent-$(LIBEVENT_VERSION).tar.gz" ]; then curl -OL https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable/libevent-$(LIBEVENT_VERSION)-stable.tar.gz; fi;
	if [ ! -d "libevent-$(LIBEVENT_VERSION)" ]; then tar xvf libevent-$(LIBEVENT_VERSION).tar.gz; fi

libevent_config:
	( cd libevent-$(LIBEVENT_VERSION); \
		CC=gcc-6.3.0 ./config --prefix=${BSPROOTFS} --openssldir=/System/Library/OpenSSL no-shared \
		no-afalgeng no-asm no-async no-bf no-blake2 no-camellia no-capieng no-cast no-chacha no-cmac no-cms no-comp \
		no-crypto-mdebug no-crypto-mdebug-backtrace no-ct no-des no-dgram no-dsa no-dso no-dtls no-dtls1 no-dtls1-method \
		no-dynamic-engine no-ec2m no-ec_nistp_64_gcc_128 no-egd no-engine no-err no-gost no-heartbeats no-idea no-md2 \
		no-md4 no-mdc2 no-multiblock no-nextprotoneg no-ocb no-ocsp no-poly1305 no-posix-io no-psk no-rc2 no-rc4 no-rc5 \
		no-rdrand no-rfc3779 no-rmd160 no-scrypt no-sctp no-seed no-shared no-sock no-srp no-srtp no-ssl no-ssl3 \
		no-ssl3-method no-ssl-trace no-stdio no-tls no-tls1 no-tls1-method no-ts no-ui no-unit-test no-weak-ssl-ciphers \
		no-whirlpool no-zlib no-zlib-dynamic -DPURIFY \
	)

libevent_build:
	make -C libevent-$(LIBEVENT_VERSION) -j ${BSPJOB}

libevent_install:
	make -C libevent-$(LIBEVENT_VERSION) install_sw

libevent_uninstall:
	make -C libevent-$(LIBEVENT_VERSION) uninstall_sw

libevent_clean:
	if [ -f "libevent-$(LIBEVENT_VERSION)/Makefile" ]; then make -C libevent-$(LIBEVENT_VERSION) distclean; fi

libevent_distclean:
	rm -rf libevent-$(LIBEVENT_VERSION)

