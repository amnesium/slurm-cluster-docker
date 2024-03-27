#!/bin/sh
set -ex

rm -rf "../slurm-cluster/slurm/out"
mkdir -p "$(pwd)/out"
docker build -f rhel9/Dockerfile -t builder:rhel9 rhel9/
docker run --rm \
  -v "$(pwd)/out:/out" \
  builder:rhel9 \
  sh -c "cp -R /root/rpmbuild/RPMS/* /out/"


cat <<EOF > "$(pwd)/out/local-repo.repo"
[local-repo]
name=local-repo
baseurl=file:///opt/local-repo/x86_64
enabled=1
gpgcheck=0
protect=1
EOF

mv "$(pwd)/out" ../slurm-cluster/slurm/
