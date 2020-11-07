# Cambridge Service for Data Driven Discovery (CSD3)

# Registration

To use the computing and data services of CSD3, we need to sign up this [online application form](https://www.hpc.cam.ac.uk/applications-access-research-computing-services) (Raven login).

Notes:<br/>
- "Service Level" choose "Non-paying (SL3) only" <br/>
- "Compute Platforms" tick "Peta4-KNL" and "Wilkes2-GPU" <br/>
- "dedicated nodes" tick "none" <br/>
- SL2 resources <br/>


# Log-in

To log-in you need to use Secure Shell (SSH).

If you have a Linux/MacOSX/UNIX system, open a command window. <br/>
If you have a Windows system, you can download and use [Putty](https://www.putty.org/) or [Windows Visual Studio Code](https://code.visualstudio.com/).


There are several login nodes, depending on the cluster you want to use: <br/>

  - To access the Peta4-Skylake (CPU cluster) nodes: <br/>
    ``` ssh <username>@login-cpu.hpc.cam.ac.uk ```
    
  - To access the Peta4-KNL (KNL cluster) nodes: <br/>
    ``` ssh <username>@login-knl.hpc.cam.ac.uk ```
    
  - To access the Wilkes2-GPU (GPU cluster) nodes: <br/> 
    ``` ssh <username>@login-gpu.hpc.cam.ac.uk ```

Replace 'username' by you CRSid, your password will be your Raven's one. <br/>
  
For more info, see: https://docs.hpc.cam.ac.uk/hpc/user-guide/connecting.html

# Launch jobs

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

# Modules

To get the list of modules installed on the cluster, type: 

``` module avail ```
To load a moudle, type: 

``` module load <module_name> ```

# Run R Scripts

## Load R (ver 4.0.2) module

``` module load r-4.0.2-gcc-5.4.0-xyx46xb ```

We can also choose other versions of R if necessary.

## Install R packages

We first need to run R interactively by simply calling ``` R ``` within SSH, after which we can install R packages using ``` install.packages ```

For example, to install cellranger, one can use:

More info can be found at [this page](https://docs.hpc.cam.ac.uk/hpc/software-packages/r.html)

# An exemple


[tutorials package](https://education.rstudio.com/blog/2020/09/delivering-learnr-tutorials-in-a-package/)


[CLIMB](https://bryn.climb.ac.uk/user/login/?next=/)
[GVL](https://www.gvl.org.au/about/)
