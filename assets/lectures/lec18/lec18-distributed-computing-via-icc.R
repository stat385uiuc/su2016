## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----access_shell, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/access_shell.png")

## ---- eval = F, engine="bash"--------------------------------------------
## [username@hostname directory]$

## ---- eval = F, engine="bash"--------------------------------------------
## [balamut2@taubh2 ~]$

## ----engine="bash"-------------------------------------------------------
pwd

## ----engine="bash"-------------------------------------------------------
cd ../ && pwd # Go one directory up

## ----engine="bash"-------------------------------------------------------
cd ~/ && pwd # Go to base directory

## ----engine="bash"-------------------------------------------------------
ls ~/BoxSync/stat385               # List files

## ----engine="bash"-------------------------------------------------------
ls -l ~/BoxSync/stat385 | grep lec # List files with lec

## ----engine="bash"-------------------------------------------------------
mkdir test       # Make directory in `pwd`

## ----engine="bash"-------------------------------------------------------
mkdir -p new/dir # The -p makes all directories

## ----engine="bash"-------------------------------------------------------
rmdir test       # Remove directory

## ----engine="bash"-------------------------------------------------------
rmdir -p new/dir # The -p recursively removes

## ---- eval = F, engine="bash"--------------------------------------------
## ls -l | grep "file.R" # File does not exist
## 
## # empty return

## ----engine="bash"-------------------------------------------------------
touch file.R          # Create File

ls -l | grep "file.R" # Check for existence

## ---- eval = F, engine="bash"--------------------------------------------
## vi file.R # Open file

## ----engine="bash"-------------------------------------------------------
echo "line 1" >> file.R
echo "line 2" >> file.R

## ----engine="bash"-------------------------------------------------------
cat <<EOF >> file.R
line 3
line 4
line 5
line 6
EOF

## ----engine="bash"-------------------------------------------------------
cat file.R     # Show file contents

## ---- eval = F, engine="bash"--------------------------------------------
## chmod 777 file.R      # Everyone can read, write, access
## 
## chmod u+wxr file.R    # Only owner can read, write, access

## ----engine="bash"-------------------------------------------------------
head -2 file.R   # Show top 2 lines

## ----engine="bash"-------------------------------------------------------
tail -1 file.R   # Show last line

## ----engine="bash"-------------------------------------------------------
cp file.R file.R.bck # Create a back up

## ----engine="bash"-------------------------------------------------------
ls -l | grep ".bck"  # Check that it is there

## ----engine="bash"-------------------------------------------------------
mv file.R.bck file_in_use.R        # Rename file

## ----engine="bash"-------------------------------------------------------
mv file_in_use.R img/file_in_use.R # Move to new directory

## ----engine="bash"-------------------------------------------------------
rm file.R            # Remove file

## ----engine="bash"-------------------------------------------------------
# Remove file in different directory
rm img/file_in_use.R 

## ----engine="bash"-------------------------------------------------------
samplevar="Hi stat385"    # Create a variable

echo $samplevar           # Print variable

## ----cc_diagram, out.width = "275px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/cc-diagram.png")

## ---- eval = F, engine="bash"--------------------------------------------
## ssh netid@cc-login.campuscluster.illinois.edu
## # Enter password

## ---- eval = F, engine="bash"--------------------------------------------
## ssh balamut2@cc-login.campuscluster.illinois.edu
## # nottelling

## ---- eval = F, engine="bash"--------------------------------------------
## # Create a directory for your R packages
## # Note: This counts against your 2 GB home dir limit on ICC
## mkdir ~/Rlibs
## 
## # Load the R modulefile
## # You may want to specify version e.g. R/3.2.2
## module load R
## 
## # Set the R library environment variable (R_LIBS) to include your R package directory
## export R_LIBS=~/Rlibs
## 
## # See the path
## echo $R_LIBS

## ---- eval = F, engine="bash"--------------------------------------------
## cat <<EOF >> ~/.bashrc
##   if [ -n $R_LIBS ]; then
##       export R_LIBS=~/Rlibs:$R_LIBS
##   else
##       export R_LIBS=~/Rlibs
##   fi
## EOF

## ---- eval = F, engine="bash"--------------------------------------------
## # Use the install.packages function to install your R package.
## $ Rscript -e "install.packages('devtools',
##               '~/Rlibs', 'http://ftp.ussg.iu.edu/CRAN/')"
## 
## # Use devtools to install package
## $ Rscript -e "devtools::install_github('SMAC-Group/gmwm')"
## 
## # Devtools install from secret repo
## $ Rscript -e "devtools::install_github('stat385/netid',
##                                        subdir='secretpkg',
##                                        auth_token = 'abc')"

## ---- eval = F, engine="bash"--------------------------------------------
## # Transferring a file on your local system to your
## # home directory on the Campus Cluster:
## [user@local ~]$
## scp local.txt My_NetID@cc-login....edu:~/

## ---- eval = F, engine="bash"--------------------------------------------
## # Transferring a file in your home directory on the
## # Campus Cluster to your local system:
## [user@local ~]$
## scp My_NetID@cc-login....edu:~/remote.txt ./

## ----eval = F------------------------------------------------------------
## n = 20              # Same 20
## mu = 5              # Mean of 5
## set.seed(111)       # Set seed for reproducibility
## rnorm(n, mean = mu) # Generate Observations

## ----eval = F------------------------------------------------------------
## # Expect command line args at the end.
## args = commandArgs(trailingOnly = TRUE)
## 
## # Skip args[1] to prevent getting --args
## 
## # Extract and cast as numeric from character
## rnorm(n = as.numeric(args[2]), mean = as.numeric(args[3]))

## ---- eval = F, engine="bash"--------------------------------------------
## #!/bin/bash
## #
## ## Set the maximum amount of runtime to 4 Hours
## #PBS -l walltime=04:00:00
## ## Request one node with `nodes` and one core with `ppn`
## #PBS -l nodes=1:ppn=1
## #PBS -l naccesspolicy=singleuser
## ## Name the job
## #PBS -N job name
## ## Queue in the secondary queue
## #PBS -q secondary
## ## Merge standard output into error output
## #PBS -j oe
## #####################################

## ---- eval = F, engine="bash"--------------------------------------------
## ## Grab the job id from an environment variable
## ## and create a directory for the data output
## export JOBID=`echo "$PBS_JOBID" | cut -d"[" -f1`
## mkdir $PBS_O_WORKDIR/"$JOBID"
## 
## ## Switch directory into job ID (puts all output here)
## cd $PBS_O_WORKDIR/"$JOBID"
## 
## # Load R
## module load R
## 
## ## Run R script in batch mode without file output
## Rscript $HOME/sim_runner.R --args 5 10

## ---- eval = F, engine="bash"--------------------------------------------
## qsub sim_job.pbs

## ---- eval = F, engine="bash"--------------------------------------------
## qstat -u netid

## ---- eval = F, engine="bash"--------------------------------------------
## ## Run with job array indices 1 through 6.
## #PBS -t 1-6

## ---- eval = F, engine="bash"--------------------------------------------
## #PBS -t 1-10:2
## ## gives 1,3,5,7,9

## ---- eval = F, engine="bash"--------------------------------------------
## #!/bin/bash
## #
## ## Set the maximum amount of runtime to 4 Hours
## #PBS -l walltime=04:00:00
## ## Request one node with `nodes` and one core with `ppn`
## #PBS -l nodes=1:ppn=1
## #PBS -l naccesspolicy=singleuser
## ## Name the job
## #PBS -N job name
## ## Queue in the secondary queue
## #PBS -q secondary
## ## Run with job array indices 1 through 6.
## #PBS -t 1-6
## ## Merge standard output into error output
## #PBS -j oe
## #####################################

## ---- eval = F, engine="bash"--------------------------------------------
## export JOBID=`echo "$PBS_JOBID" | cut -d"[" -f1`
## mkdir $PBS_O_WORKDIR/"$JOBID"
## 
## cd $PBS_O_WORKDIR/"$JOBID"
## 
## module load R
## 
## ## Grab the appropriate line from the input file.
## ## Put that in a shell variable named "PARAMS"
## export PARAMS=`cat ${HOME}/inputs.txt |
##                sed -n ${PBS_ARRAYID}p`
## 
## ## Run R script based on the array number.
## Rscript $HOME/sim_job.R --args $PARAMS

## ---- eval = F, engine="bash"--------------------------------------------
## 0 1
## 2 3.3
## 9 2.3
## .. ..
## 42 4.8

## ----eval = F------------------------------------------------------------
## # Expect command line args at the end.
## args = commandArgs(trailingOnly = TRUE)
## 
## # Skip args[1] to prevent getting --args
## 
## # Obtain the ID being accessed from the array
## jobid = as.integer(Sys.getenv("PBS_ARRAYID"))
## 
## # Set seed for reproducibility
## set.seed(jobid)
## 
## # Extract and cast as numeric from character
## rnorm(n = as.numeric(args[2]), mean = as.numeric(args[3]))

