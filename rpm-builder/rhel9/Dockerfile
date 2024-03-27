# syntax=docker/dockerfile:1
# Version lock. Edit these lines to update.
ARG pmix4_version=4.2.7
ARG slurm_version=slurm-23.11.5

# ------------------------------------
FROM docker.io/library/rockylinux:9.2
# ------------------------------------

LABEL MAINTAINER Square Factory

ARG pmix4_version
ARG slurm_version
ARG kernel_version

WORKDIR /work

RUN dnf install -y \
  epel-release \
  rpm-build \
  gcc \
  make \
  rsync \
  openssh-clients \
  && dnf clean all

RUN echo "%__make         /usr/bin/make -j$(nproc)" >> ~/.rpmmacros

ENV PMIX4_VERSION=${pmix4_version}
RUN dnf install -y \
  dnf-plugins-core \
  git \
  "@Development Tools" \
  && dnf config-manager --set-enabled crb \
  && dnf clean all

COPY 20_install_pmix_deps.sh 21_build_pmix.sh ./

RUN sh 20_install_pmix_deps.sh \
  && sh 21_build_pmix.sh

ENV SLURM_VERSION=${slurm_version}
COPY 32_install_slurm_deps.sh 33_build_slurm.sh ./

RUN sh 32_install_slurm_deps.sh \
  && sh 33_build_slurm.sh
