# Yet Another ZCash Builder for Apple Platform

This repository builds standalone ZCash binaries for macOS platform without installing brew.  
No additional dependency required, all tools (`autotools, cmake, gcc etc.`) and libraries (`boost`, `libsnark`) are compiled from scratch.  


### Build instructions

**NOTE: Common mistake is to clone this repo without recursive, you need to use --recursive**

`$ git clone --recursive https://github.com/kozyilmaz/zcash-apple.git`  
`$ cd zcash-apple`  
`$ source environment`  
`$ make`


After successful build ZCash binaries will be installed to `out` directory under project root  
```
bash-3.2$ ls -lrt out/usr/local/bin/
total 104760
-rwxr-xr-x  1 loki  staff       483 Apr  4 18:47 zcash-init
-rwxr-xr-x  1 loki  staff  41668528 Apr  4 19:02 zcashd
-rwxr-xr-x  1 loki  staff   5797980 Apr  4 19:02 zcash-tx
-rwxr-xr-x  1 loki  staff      3502 Apr  4 19:02 zcash-fetch-params
-rwxr-xr-x  1 loki  staff   3006696 Apr  4 19:02 zcash-cli
-rwxr-xr-x  1 loki  staff   2644540 Apr  4 19:02 libstdc++.6.dylib
-rwxr-xr-x  1 loki  staff    245464 Apr  4 19:02 libgomp.1.dylib
-rw-r--r--  1 loki  staff    255268 Apr  4 19:02 libgcc_s.1.dylib
bash-3.2$ otool -L out/usr/local/bin/zcashd
out/usr/local/bin/zcashd:
    @executable_path/libstdc++.6.dylib (compatibility version 7.0.0, current version 7.22.0)
    @executable_path/libgomp.1.dylib (compatibility version 2.0.0, current version 2.0.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1238.51.1)
    @executable_path/libgcc_s.1.dylib (compatibility version 1.0.0, current version 1.0.0)
bash-3.2$ 
```

`$ cd out/usr/local/bin`  
`$ ./zcash-fetch-params`  
`$ ./zcash-init`  
`$ ./zcashd`  




