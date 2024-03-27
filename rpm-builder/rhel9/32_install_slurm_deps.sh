#!/bin/sh
# Minimal dependencies for slurm
set -ex

dnf install -y \
     openssl-devel \
     perl-Switch \
     perl-ExtUtils-MakeMaker \
     http-parser-devel \
     json-c-devel \
     munge-devel \
     munge-libs \
     mariadb-devel \
     pam-devel \
     python3 \
     python3-pip \
     python3-devel \
     readline-devel \
     ncurses-devel \
     libyaml-devel \
     freeipmi \
     hwloc-devel \
     numactl-devel \
     pam-devel \
     lz4-devel \
     man2html \
     libssh2-devel \
     libcurl-devel \
     rrdtool-devel \
     libjwt-devel \
     lua-devel \
     gtk2-devel \
     kernel-headers \
     xorg-x11-xauth &&
     dnf clean all

##     dbus-devel \

pip3 install mysqlclient
