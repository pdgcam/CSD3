# CSD3
Submit R jobs using Cambridge HPC

# Registration

To access the Cambridge HPC, we first need to sign up this [online application form](https://www.hpc.cam.ac.uk/applications-access-research-computing-services) (Raven login).

Notes:

- "Service Level" choose "Non-paying (SL3) only"

- "Compute Platforms" tick "Peta4-KNL" and "Wilkes2-GPU"

- "dedicated nodes" tick "none"

- SL2 resources


# Log-in

To log-in you need to use SSH.

If you have a Linux/MacOSX/UNIX system, open a command window.

If you have a Windows system, you can download [Putty](https://www.putty.org/).


There are several login nodes, depending on the cluster you want to use: 

  - To access the Peta4-Skylake (CPU cluster) nodes:
  
    ``` ssh <username>@login-cpu.hpc.cam.ac.uk ```
    
  - To access the Peta4-KNL (KNL cluster) nodes:
  
    ``` ssh <username>@login-knl.hpc.cam.ac.uk ```
    
  - To access the Wilkes2-GPU (GPU cluster) nodes:
  
    ``` ssh <username>@login-gpu.hpc.cam.ac.uk ```

Replace 'username' by you CRSid, your password will be your Raven's one.
  
For more info, see: https://docs.hpc.cam.ac.uk/hpc/user-guide/connecting.html

# Launch jobs

The cluster uses the slurm submission system. Templates of shell script to run jobs can be found in you user folder. 

## Basic parameters to launch a job

| Command | Description |
| --- | --- |
| -A | Project to be charged (see ```mybalance``` to know whic of you should use)|
| -p | Partition to use (either skylake, skylake-himem, ...) |
| --mem-per-node | List all new or modified files |
| --mem | Total memory requested |
| --time | Wallclock time required for the job |
## More specific parameters

### Arrays

### GPUs

To get more info on slurm:

- [Slurm documentation](https://slurm.schedmd.com/documentation.html)

- [another](https://modules.readthedocs.io/en/latest/module.html)

# Folder organisation/space

# Modules

To get the list of modules installed on the cluster, type: 

``` module avail ```
To load a moudle, type: 

``` module load <module_name> ```




[tutorials package](https://education.rstudio.com/blog/2020/09/delivering-learnr-tutorials-in-a-package/)

[CLIMB](https://bryn.climb.ac.uk/user/login/?next=/)
[GVL](https://www.gvl.org.au/about/)
