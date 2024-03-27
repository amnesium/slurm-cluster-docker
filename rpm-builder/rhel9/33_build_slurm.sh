#!/bin/sh
set -ex

curl -fsSL "https://download.schedmd.com/slurm/${SLURM_VERSION}.tar.bz2" -o "${SLURM_VERSION}.tar.bz2"

rpmbuild -tb "${SLURM_VERSION}.tar.bz2" \
	--with mysql \
	--with slurmrestd \
	--with hwloc \
	--with numa \
	--with lua \
	--with jwt \
	--without debug \
	--define "_with_pmix --with-pmix=/usr/lib64/pmix4"
rm "${SLURM_VERSION}.tar.bz2"
