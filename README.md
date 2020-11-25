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

There are several login nodes, depending on the cluster to use: <br/>

(1) To access the Peta4-Skylake (CPU cluster) nodes, type ``` ssh <username>@login-cpu.hpc.cam.ac.uk ``` <br/>
- Each Peta4-Skylake node has 32 CPU cores, with 6GB per CPU (192GB total RAM) or 12GB per CPU (384GB total RAM). <br/>
- Within the "slurm_submit" file, use ``` #SBATCH -p skylake ``` to access 6GB per CPU nodes, and use ``` #SBATCH -p skylake-himem ``` to access 12GB per CPU nodes. <br/>
- On Peta4-Skylake, SL1 and SL2 users are limited to 1280 cores in use at any one time (maximum walltime of 36 hours per job), and SL3 users are limited to 320 cores (maximum walltime of 12 hours per job per job). <br/>

(2) To access the Peta4-KNL (KNL cluster) nodes, type ``` ssh <username>@login-knl.hpc.cam.ac.uk ``` <br/>
- Each Peta4-KNL node contains 256 logical CPUs <br/>
- The memory mode of the KNL nodes allocated can be specified with the #SBATCH -C option. <br/>
- On Peta4-KNL, SL1 and SL2 users are limited to 128 nodes in use at any one time (maximum walltime of 36 hours per job), and SL3 users are limited to 64 nodes (maximum walltime of 12 hours per job per job). <br/>
    
(3) To access the Wilkes2-GPU (GPU cluster) nodes, type ``` ssh <username>@login-gpu.hpc.cam.ac.uk ``` <br/>
- Each Wilkes2-GPU node contains 4 NVIDIA P100 GPUs. <br/>
  On Wilkes2-GPU, SL1 and SL2 are limited to 64 GPUs in use at any one time (maximum walltime of 36 hours per job), and SL3 users are limited to 32 GPUs (maximum walltime of 12 hours per job per job). <br/>. <br/>

Replace 'username' by you CRSid, your password will be your Raven's one. <br/>
SL = Service Level. <br/>

For more info, see: https://docs.hpc.cam.ac.uk/hpc/user-guide/connecting.html

## Charges for each type of cluster see [here](https://www.hpc.cam.ac.uk/policies/charges)<br/>

| Cluster | Paid unit hours | Price per unit hour |
| --- | --- | --- |
| Peta4-Skylake | CPU core hours | £0.010 |
| Peta4-KNL | KNL node hours | £0.140 |
| Wilkes2-GPU | GPU hours | £0.200 |



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




# Slurm system (workload management and job scheduling system): Basic concepts

Partition

Node

SLURM

# Managing Jobs

| Command | Description |
| --- | --- |
| ``` sinfo ``` | Information about given partition |
| ``` scontrol ``` | Information about given node |
| ``` squeue ``` | Show global cluster information |
| ``` scontrol show job nnnn ``` | Examine the job with jobid nnnn |
| ``` scontrol show node nodename ``` | Examine the node with name nodename |
| ``` sbatch ``` | Submits an executable script to the queueing system |
| ``` sintr ``` | Submits an interactive job to the queueing system |
| ``` srun ``` | Run a command either as a new job or within an existing job |
| ``` scancel ``` | Delete a job |
| ``` mybalance ``` | Show current balance of core hour credits |

Here is a [cheatsheet](https://slurm.schedmd.com/pdfs/summary.pdf) and [list](https://slurm.schedmd.com/man_index.html) of job managing commands.

## Examples:
- ``` sinfo -p skylake ``` Check info and available resources about skylake partition <br/>
- ``` sinfo -p skylake -l ``` As above, list format <br/>
- ``` sinfo -p skylake -Nel ``` As above, detailed info <br/>
- ``` sinfo -p skylake -O nodelist,memory,cpus ``` Get memory and number of CPUs <br/>
- ``` sinfo -p skylake -O nodehost,memory,cpus ``` As above, one line per node <br/>
- ``` sinfo -a ``` Get info about all partitions <br/>
- ``` scontrol show nodes cpu-e-1146 ``` Get detailed information about the node cpu-e-1146 <br/>



# Submitting, Controlling, and Monitoring Jobs

Cambridge CSD3 cluster uses the SLURM submission system. In normal use of SLURM, one creates a batch job which is a shell script containing the set of commands to run, plus the resource requirements for the job which are coded as specially formatted shell comments at the top of the script. The batch job script is then submitted to SLURM with the sbatch command.

Templates of SLURM submission shell scripts can be found at your home directories ``` /home/username ```. For example, <br/>
- ``` slurm_submit.peta4-skylake ``` is for running CPU jobs
- ``` slurm_submit.peta4-knl ``` is for running KNL jobs
- ``` slurm_submit.wilkes2 ``` is for running GPU jobs

Within each SLURM template, lines beginning ``` #SBATCH ``` are directives to the batch system. The rest of each directive specifies arguments to the sbatch command. SLURM stops reading directives at the first executable (i.e. non-blank, and doesn’t begin with #) line.



Lauching a lob requires both mandatory parameters and accesories ones.

## Mandatory parameters

| Command | Description |
| --- | --- |
| -A | Project to be charged (use ```mybalance``` to know which of you should use)|
| -p | Partition to use (either skylake, skylake-himem, ...) |
| --nodes | Number of nodes requested |
| --cpus-per-task | Controls the number of CPUs allocated per task |
| --mincpus | Controls the minimum number of CPUs allocated per node |
| --time | Wallclock time required for the job |
| --mem | Total memory requested |

SLURM [CPU Management User and Administrator Guide](https://slurm.schedmd.com/cpu_management.html)

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


# Acknowledging CSD3

The following acknowledgement can be used in papers: <br/>

This study was performed using resources provided by the Cambridge Service for Data Driven Discovery (CSD3) operated by the University of Cambridge Research Computing Service (www.csd3.cam.ac.uk), provided by Dell EMC and Intel using Tier-2 funding from the Engineering and Physical Sciences Research Council (capital grant EP/P020259/1), and DiRAC funding from the Science and Technology Facilities Council (www.dirac.ac.uk).


[tutorials package](https://education.rstudio.com/blog/2020/09/delivering-learnr-tutorials-in-a-package/)


[CLIMB](https://bryn.climb.ac.uk/user/login/?next=/)
[GVL](https://www.gvl.org.au/about/)
