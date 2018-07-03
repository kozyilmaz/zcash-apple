# Yet Another Zcash Builder for Apple Platform

![Screenshot](https://github.com/kozyilmaz/zcash-apple/raw/master/docs/zcash-apple.png "Zcash on Mac OS")

**This project requires Xcode 9 and a Mac running macOS 10.12.6 or later.**  
This repository builds standalone Zcash binaries for macOS platform without installing brew.  
All build tools (`autoconf, automake, libtool, pkgconfig, cmake, install and readlink`) and `Zcash` are compiled from scratch.  


### Build instructions
```shell
# run once to install Xcode CLI tools
$ xcode-select --install
# clone and build Zcash on macOS
$ git clone https://github.com/kozyilmaz/zcash-apple.git
$ cd zcash-apple
$ source environment
$ make
```

In case of an error please run the following command for debug info
```shell
$ PRINT_DEBUG=y make all
```

After successful build Zcash binaries will be installed to `out` directory under project root  
You can then copy binary directory anywhere you like there are no dependencies to the build tree anymore  
```shell
bash-3.2$ ls -lrt out/usr/local/bin
total 32136
-rwxr-xr-x@ 1 loki  staff       483 Feb 25 21:19 zcash-init
-rw-r--r--@ 1 loki  staff      1766 Feb 25 21:19 zcash-commands.txt
-rwxr-xr-x@ 1 loki  staff  13369544 Feb 25 21:39 zcashd
-rwxr-xr-x@ 1 loki  staff   1814860 Feb 25 21:39 zcash-tx
-rwxr-xr-x@ 1 loki  staff      4761 Feb 25 21:39 zcash-fetch-params
-rwxr-xr-x@ 1 loki  staff   1238732 Feb 25 21:39 zcash-cli
-rw-r--r--@ 1 loki  staff        54 Feb 25 21:39 version.txt
bash-3.2$ otool -L out/usr/local/bin/zcashd
out/usr/local/bin/zcashd:
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.0.0)
    /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.0)
bash-3.2$ otool -L out/usr/local/bin/zcash-cli 
out/usr/local/bin/zcash-cli:
    /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.0.0)
bash-3.2$ otool -L out/usr/local/bin/zcash-tx
out/usr/local/bin/zcash-tx:
    /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.0.0)
```

### Run instructions

When launching `Zcash` on MacOS for the first time, certain initalization steps should be completed.  
Please run the commands below once for the first time  

```shell
$ cd out/usr/local/bin

# for testnet
$ ./zcash-fetch-params --testnet

# for mainnet
$ ./zcash-fetch-params

$ ./zcash-init
$ ./zcashd
```

You can just run `Zcash` by launching the daemon afterwards. After blockchain is sync'd, you can use the sample commands provided in [zcash-commands.txt](zcash/files/zcash-commands.txt)  

`$ ./zcashd`  

Console output from the first run is below:
```shell
bash-3.2$ ./zcash-fetch-params
Zcash - fetch-params.sh

This script will fetch the Zcash zkSNARK parameters and verify their
integrity with sha256sum.

If they already exist locally, it will exit now and do nothing else.
The parameters are currently just under 911MB in size, so plan accordingly
for your bandwidth constraints. If the files are already present and
have the correct sha256sum, no networking is used.

Creating params directory. For details about this directory, see:
/Users/loki/Library/Application Support/ZcashParams/README

Retrieving: https://z.cash/downloads/sprout-proving.key
######################################################################## 100.0%
/Users/loki/Library/Application Support/ZcashParams/sprout-proving.key.dl: OK
/Users/loki/Library/Application Support/ZcashParams/sprout-proving.key.dl -> /Users/loki/Library/Application Support/ZcashParams/sprout-proving.key
Retrieving: https://z.cash/downloads/sprout-verifying.key
######################################################################## 100.0%
/Users/loki/Library/Application Support/ZcashParams/sprout-verifying.key.dl: OK
/Users/loki/Library/Application Support/ZcashParams/sprout-verifying.key.dl -> /Users/loki/Library/Application Support/ZcashParams/sprout-verifying.key
bash-3.2$ 
bash-3.2$ cat zcash-init 
#!/bin/bash

# excerpted from zclassic/zutil/init-mac.sh

if [ ! -f "$HOME/Library/Application Support/Zcash/zcash.conf" ]; then
    echo "Creating zcash.conf"
    mkdir -p "$HOME/Library/Application Support/Zcash/"
    echo "rpcuser=zcashrpc" > ~/Library/Application\ Support/Zcash/zcash.conf
    PASSWORD=$(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    echo "rpcpassword=$PASSWORD" >> "$HOME/Library/Application Support/Zcash/zcash.conf"
    echo "Complete!"
fi
bash-3.2$ 
bash-3.2$ ./zcash-init 
Creating zcash.conf
Complete!
```

## Running the testnetwork
Modify your ```$HOME/Library/Application\ Support/Zcash/zcash.conf``` file and make sure it looks like this:

``` 
rpcuser=SOME_USERNAME
rpcpassword=SOME_PASSWORD

### connect to test network
testnet=1
addnode=testnet.z.cash
```
You can read more about configs and changing between network [here](https://github.com/zcash/zcash/blob/master/contrib/debian/examples/zcash.conf) on zcash's example config file.

Now your config is good to go, start the network back up:
``` 
cd $HOME/.zcash/zcash-apple/out/usr/local/bin
./zcashd
```

## See / query which network is running
``` 
cd $HOME/.zcash/zcash-apple/out/usr/local/bin
./zcash-cli getmininginfo
```
should look like this:
``` 
"testnet": true,
  "chain": "test",
```

## Thanks
Developers of `Zcash`  
Developers of `ZClassic` for MacOS patches

## Donations
If you feel this project is useful to you. Feel free to donate.

    BTC address: 1GmXRm5sEATy3Kz1hCxS1dwfXuCPkevsa
    ZEC address: t1MW8Vx4SF1ewmL3rTN8UfRxULFTaugh1ab


### Disclaimer
This program is not officially endorsed by or associated with the Zcash project and the Zcash company.
[Zcash®](https://trademarks.justia.com/871/93/zcash-87193130.html) and the 
[Zcash® logo](https://trademarks.justia.com/868/84/z-86884549.html) are trademarks of the
[Zerocoin Electric Coin Company](https://trademarks.justia.com/owners/zerocoin-electric-coin-company-3232749/).

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
