#!/bin/sh

# get version info
git_rev_output=$(git rev-parse --verify HEAD)
git_tag_output=$(git describe --all --exact-match $git_rev_output)
git_status_output=$(git diff)

# check if associated tag exist for that commit
if [[ $git_tag_output == *"tags"* ]]; then
   git_tag_string=${git_tag_output##*/}
else
   git_tag_string="unknown"
fi

# check for any code modifications
if [ -n "$git_status_output" ]; then
   git_rev_string=$git_rev_output-dirty
   git_tag_string="unknown"
else
   git_rev_string=$git_rev_output
fi

# pick version string (tag name, if exists or commit version)
if [[ $git_tag_string == "unknown" ]]; then
   release_version=$git_rev_string
else
   release_version=$git_tag_string
fi

echo "zcash-for-macos commit version : $git_rev_string"
echo "zcash-for-macos tag version    : $git_tag_string"
echo "creating 'zcash-macos-$release_version' release"

# prepare environment
source environment;
export BSPJOB=16;
export BSPINSTALL=${BSPROOT}/zcash-macos-$release_version;

# build tools
make
echo $git_rev_string  > ${BSPINSTALL}/usr/local/bin/version.txt
echo $git_tag_string >> ${BSPINSTALL}/usr/local/bin/version.txt
echo "Zcash for macOS ($release_version) is installed to ${BSPINSTALL}"

# create tarball and checksum
echo "creating Zcash tarball 'zcash-macos-$release_version.tar.bz2' and checksum"
tar -cjvf zcash-macos-$release_version.tar.bz2 zcash-macos-$release_version
shasum -a 256 zcash-macos-$release_version.tar.bz2 > zcash-macos-$release_version.tar.bz2.hash
shasum -a 256 -c zcash-macos-$release_version.tar.bz2.hash
