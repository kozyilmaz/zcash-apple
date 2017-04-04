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
zcashd
zcash-cli
zcash-tx
```


