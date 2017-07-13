#!/bin/sh

# get version info
git_revision_output=$(git rev-parse --verify HEAD)
git_tag_output=$(git describe --all --exact-match $git_revision_output)
git_status_output=$(git diff)

# check associated tag
if [[ $git_tag_output == *"tags"* ]]; then
   git_tag_string=${git_tag_output##*/}
else
   git_tag_string="unknown"
fi

# check for modifications
if [ -n "$git_status_output" ]; then
   git_version_string=$git_revision_output-dirty
   git_tag_string="unknown"
else
   git_version_string=$git_revision_output
fi

echo "zcash-for-macos commit version : $git_version_string"
echo "zcash-for-macos tag version    : $git_tag_string"
echo "creating 'zcash-macos-$git_tag_string' release"

# prepare environment
source environment;
export BSPJOB=16;
export BSPINSTALL=${BSPROOT}/zcash-macos-$git_tag_string;

# build tools
make
echo $git_version_string > ${BSPINSTALL}/usr/local/bin/version.txt
echo $git_tag_string    >> ${BSPINSTALL}/usr/local/bin/version.txt
echo "Zcash for macOS ($git_tag_string) is installed to ${BSPINSTALL}"

# create tarball and checksum
echo "creating Zcash tarball 'zcash-macos-$git_tag_string.tar.bz2' and checksum"
tar -cjvf zcash-macos-$git_tag_string.tar.bz2 zcash-macos-$git_tag_string
shasum -a 256 zcash-macos-$git_tag_string.tar.bz2 > zcash-macos-$git_tag_string.tar.bz2.hash
shasum -a 256 -c zcash-macos-$git_tag_string.tar.bz2.hash
