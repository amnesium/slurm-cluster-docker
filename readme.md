
# Slurm-cluster-docker
The goal of this repository is to quickly spin-up a basic Slurm cluster for demo purposes.
The slurm login node, controller and compute nodes are containerized and run via docker compose, while the NFS server used to create a shared storage between the nodes is running in a VM using vagrant.
As it is a demo cluster, there is no RDMA, parallel file system nor GPU support.

## Dependencies:  
* docker  
* docker compose  
* libvirt and virt-manager  
* vagrant  
* vagrant-libvirt  
  
## Deployment  
  
### NFS server (virtual machine)  

    cd nfs-server 
    vagrant up`

(If you can't see your VM in virt-manager, try: virt-manager -c qemu:///session)  
  
### Slurm Cluster (containers)  
**Build the rpm packages**
    
    cd ../rpm-builder
    ./build.sh
    cd ../slurm-cluster

**Generate hostkeys for ssh**
    
    ./regenerate-hostkeys.sh

**Generate the munge key for slurm**
    
    dd if=/dev/random of=/secrets/munge/munge.key bs=1024 count=1

**Remember to update the IP of the homedir NFS volume in docker-compose.yml with the IP of your VM**

**Spin-up the cluster!**
    
    docker compose up -d --build