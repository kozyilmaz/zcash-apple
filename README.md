# Yet Another ZCash Builder for Apple Platform
This repository builds standalone ZCash binaries for macOS platform without installing brew.  
No additional dependency required, all tools (`autotools, cmake, gcc etc.`) and libraries (`boost`, `libsnark`) are compiled from scratch.  


### Build instructions
**NOTE: Common mistake is to clone this repo without recursive, you need to use --recursive**

`$ git clone --recursive https://github.com/kozyilmaz/zcash-apple.git`  
`$ cd zcash-apple`  
`$ source environment`  
`$ make`


### Run instructions
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

Vaklinov's [Desktop GUI Wallet](https://github.com/vaklinov/zcash-swing-wallet-ui) also works, please follow [build instructions for MacOS](https://github.com/vaklinov/zcash-swing-wallet-ui/blob/master/docs/Readme-Mac.md)

## Thanks
Developers of `Zcash`
Developers of `ZClassic` for MacOS patches

## Donations
If you feel this project is useful to you. Feel free to donate.

    BTC address: 1GmXRm5sEATy3Kz1hCxS1dwfXuCPkevsa
    ZEC address: t1Z3dksJWjgtD5R62zsHm7ZjKSFxZYnC31a


### Disclaimer
This program is not officially endorsed by or associated with the ZCash project and the ZCash company.
[ZCash®](https://trademarks.justia.com/871/93/zcash-87193130.html) and the 
[ZCash® logo](https://trademarks.justia.com/868/84/z-86884549.html) are trademarks of the
[Zerocoin Electric Coin Company](https://trademarks.justia.com/owners/zerocoin-electric-coin-company-3232749/).

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

