# Cambridge Service for Data Driven Discovery (CSD3)

# Registration

To use the computing and data services of CSD3, please first sign up this [online application form](https://www.hpc.cam.ac.uk/applications-access-research-computing-services) (Raven login).

Notes:<br/>
- "Service Level" choose "Non-paying (SL3) only" <br/>
- "Compute Platforms" tick "Peta4-KNL" and "Wilkes2-GPU" <br/>
- "dedicated nodes" tick "none" <br/>
- SL2 resources <br/>


# Log-in

## To log-in you need to use Secure Shell (SSH).

For Linux/MacOSX/UNIX system, open a command window. <br/>
For Windows system, please download and use [Putty](https://www.putty.org/) or [Windows Visual Studio Code](https://code.visualstudio.com/).

There are several login nodes, depending on the cluster you want to use: <br/>

  - To access the Peta4-Skylake (CPU cluster) nodes, type ``` ssh <username>@login-cpu.hpc.cam.ac.uk ``` <br/>
    
    On Peta4-Skylake, SL1 and SL2 users are limited to 1280 cores in use at any one time and a maximum wallclock runtime of 36 hours per job. <br/>
    
    
  - To access the Peta4-KNL (KNL cluster) nodes, type ``` ssh <username>@login-knl.hpc.cam.ac.uk ``` <br/>
    
    On Peta4-KNL, SL1 and SL2 users are limited to 128 nodes in use at any one time and a maximum wallclock runtime of 36 hours per job. <br/>
    
  - To access the Wilkes2-GPU (GPU cluster) nodes, type ``` ssh <username>@login-gpu.hpc.cam.ac.uk ``` <br/> 
    
    On Wilkes2-GPU, SL1 and SL2 are limited to 64 GPUs in use at any one time and a maximum wallclock runtime of 36 hours per job. <br/>
    
    SL3 users are similarly limited to 320 cores (Peta4-Skylake), 64 nodes (Peta4-KNL) and 32 GPUs (Wilkes2-GPU), all with up to 12 hours per job. <br/>

Replace 'username' by you CRSid, your password will be your Raven's one. <br/>

For more info, see: https://docs.hpc.cam.ac.uk/hpc/user-guide/connecting.html

## First-time login

We will be asked to check if the host key fingerprints are correct during the first time of login.<br/>
Please check details [here](https://docs.hpc.cam.ac.uk/hpc/user-guide/hostkeys.html#first-time-login).

# Modules

Loading a module establishes the environment required to find the related include and library files at compile-time and run-time.

| Command | Description |
| --- | --- |
| ``` module avail ``` or ``` module av ``` | Check the list of modules installed on the cluster |
| ``` module av r- ``` | Check the list of modules with heading 'r-' |
| ``` module list ``` | Check the modules that have been loaded |
| ``` module load <module_name> ``` | Load a moudle |
| ``` module unload <module> ``` | unload a module |
| ``` module whatis ``` | show available modules with brief explanation |




# Slurm system (the job queueing system software): Basic concepts

Partition

Node

SLURM

# SLURM Commands: Partition/Node State Information

| Command | Description |
| --- | --- |
| ``` sinfo ``` | Information about given partition |
| ``` scontrol ``` | Information about given node |

## Examples:
- ``` sinfo -p skylake ``` Check info and available resources about skylake partition <br/>
- ``` sinfo -p skylake -l ``` As above, list format <br/>
- ``` sinfo -p skylake -Nel ``` As above, detailed info <br/>
- ``` sinfo -p skylake -O nodelist,memory,cpus ``` Get memory and number of CPUs <br/>
- ``` sinfo -p skylake -O nodehost,memory,cpus ``` As above, one line per node <br/>
- ``` sinfo -a ``` Get info about all partitions <br/>
- ``` scontrol show nodes cpu-e-1146 ``` Get detailed information about the node cpu-e-1146 <br/>




# SLURM Commands: Submitting, Controlling, and Monitoring Jobs

The cluster uses the slurm submission system. Templates of shell scripts to run jobs can be found in you user folder.

Lauching a lob requires both mandatory parameters and accesories ones.

## Mandatory parameters

| Command | Description |
| --- | --- |
| -A | Project to be charged (see ```mybalance``` to know which of you should use)|
| -p | Partition to use (either skylake, skylake-himem, ...) |
| --nodes | Number of nodes requested |
| --cpus-per-task | Number of cpus requsted for the job |
| --time | Wallclock time required for the job |
| --mem | Total memory requested |

Example: 
- line of code
``` srun [options] line of code ```
- shell script (.sh)/ format:
``` sbatch xxx.sh ```

## More specific parameters

| Command | Description |
| --- | --- |
| -XXXX | XXXX |

### Arrays

### GPUs

To get more info on slurm:

- [Slurm documentation](https://slurm.schedmd.com/documentation.html)

- [another](https://modules.readthedocs.io/en/latest/module.html)

# Folder organisation/space


# File transfers

For Windows system, we can use [WinSCP](https://winscp.net/eng/download.php) to transfer data and code between local disk and CSD3 cluster.

Set up of WinSCP can be found at [here](https://winscp.net/eng/docs/start)


# Run R Scripts

## Load R (ver 4.0.2) module

``` module load r-4.0.2-gcc-5.4.0-xyx46xb ```

We can also choose other versions of R if necessary.

## Install R packages

We can install R packages using the following steps: <br/>
- Load the correct version of R. For example, if we want to use R (4.0.2), then do ``` module load r-4.0.2-gcc-5.4.0-xyx46xb ``` within SSH <br/>
- Check if the target version of R has been loaded correctly by using ``` module list ``` <br/>
- Run R interactively by simply calling ``` R ``` within SSH <br/>
- Install R packages using ``` install.packages ``` <br/>

More info can be found at [this page](https://docs.hpc.cam.ac.uk/hpc/software-packages/r.html)

# An exemple (Fitting age-based model)


[tutorials package](https://education.rstudio.com/blog/2020/09/delivering-learnr-tutorials-in-a-package/)


[CLIMB](https://bryn.climb.ac.uk/user/login/?next=/)
[GVL](https://www.gvl.org.au/about/)
