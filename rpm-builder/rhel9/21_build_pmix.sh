#!/bin/sh
set -ex

curl -fsSL "https://github.com/openpmix/openpmix/releases/download/v${PMIX4_VERSION}/pmix-${PMIX4_VERSION}.tar.bz2" -o "pmix-${PMIX4_VERSION}.tar.bz2"
rpmbuild -tb "pmix-${PMIX4_VERSION}.tar.bz2" --define "_prefix /usr/lib64/pmix4" --define "_name pmix4"
rpm -i "/root/rpmbuild/RPMS/x86_64/pmix4-${PMIX4_VERSION}-1.el9.x86_64.rpm"
rm -f "pmix-${PMIX4_VERSION}.tar.bz2"
