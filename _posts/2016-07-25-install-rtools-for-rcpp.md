---
title: "Install RTools on Windows"
author: "James Balamuta"
date: "July 25, 2016"
layout: post
categories: announcements
tags: [course, rcpp, rtools]
---

# Introduction

Compiled code in *R* is the zeitgeist echoing throughout all corridors of
user styles. The advent of *Rcpp* and the afforded seamless transition between
*R* objects and *C++* objects has yielded countless accolades. However, there
is a gatekeeper to enabling *Rcpp* outside of the *R* environment: A compiler. 
Enter into the picture [Rtools](https://cran.r-project.org/bin/windows/Rtools/),
which provides a toolchain to compile code with *R*. 

# Prerequisite

In order to follow this installation guide, you must:

1. Be on Windows 7 or greater. 
2. Have R version 3.3.0 or greater. 
    - [Rtools](https://cran.r-project.org/bin/windows/Rtools/) radically changed before then
3. Be able to launch an application via "Run as Administrator" prompt.

# Install Guide

The steps below will guide you through setting up the *Rtools* toolchain on Windows. 
The version these steps are done for is *Rtools* 3.4. Generally, each *R* point
release (x.y.0) yields an equivalent *Rtools* release. 

- **Step 1:** Go to <https://cran.r-project.org/bin/windows/Rtools/>
- **Step 2:** Select the latest Rtools version (3.4 in our case)

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_homepage.PNG)

- **Step 3:** Open the folder location where Rtools can be found.
- **Step 4:** Right click on the "Rtools34.exe" and select "Run as administrator"

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_run_as_admin.PNG)

- **Step 4:** Accept the UAC prompt that appears

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_uac.PNG)

- **Step 5:** Select the appropriate language and press "OK"

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_language.PNG)

- **Step 6:** Press "Next" to begin the install process

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_licensing.PNG)

- **Step 7:** Agree to the terms of the licenses used by the toolchain by pressing
"Next".

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_licensing.PNG)

- **Step 8:** Select the install directory for *Rtools* and press "Next".
     - I strongly recommend **against** switching away from the default. 
     - Default directory: `c:\Rtools`
     
![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_install_directory.PNG)

- **Step 9:** Ensure only the installer is following the
"Package authoring installation" guidelines and press "Next".

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_install_components.PNG)

- **Step 10:** Elect to modify the [Windows PATH variable](http://superuser.com/a/949577/429046)
to contain a reference to where the *Rtools* install directorys are by pressing "Next".

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_system_path.PNG)

- **Step 11:** Ensure that the PATH variable in the following order before pressing "Next".
     - `c:\Rtools\bin;`
     - `c:\Rtools\mingw_32\bin;`
     
![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_PATH_variable_highlight.PNG)

- **Step 12:** Note the changes to the installer will make before pressing "Next" 
to begin installing each component. 

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_install_agreement.PNG)

- **Step 13:** Wait patiently as *Rtools* installs on your system.... 

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_install_progress.PNG)

- **Step 14:** Rejoice as *Rtools* is now installed on your system!

![](/figure/source/2016-07-25-install-rtools-for-rcpp/rtools_finished_install.PNG)


If you are unsure of manually downloading the program, please use the 
[`installr` package](https://cran.r-project.org/web/packages/installr/index.html) 
to download and install Rtools.


```r
# install.packages("installr")
library("installr")
install.Rtools()
```

This will automatically download *Rtools* and give you the
previous installer prompts. 

# Verifying Install

Open your IDE of choice and type:


```cpp
Rcpp::evalCpp("2+2")
```

If the output is **not** a number (psst 4), then there is an issue with the *Rtools*
install. Please google the error and let us know about it! 

# Common Issues

None reported so far.
