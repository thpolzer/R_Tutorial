# R_Tutorial
This tutorial gives a hands-on introduction into the fundamentals of R-Programming.

IMPORTANT: Before you start: Pls adjust your RStudio settings according to "rstudio/RStudio_settings_01.jpg". For didactic purposes we have disabled automatic saving of current workspace.

To make things easier the workspace has been set to "~/R_Tutorial". That way, you do not need to adjust any file paths when loading data.
This has been done in the ~/.Rprofile file. So pls copy this .Rprofile file into your home directory.
(Pls note: Whenever you start an R session out of the ~/R_Tutorial directory R automatically searchs for a .Rprofile file within this directory and executes the included code at the beginning of your session. You can also place it into your home directory).

In order to reproduce the entire content of this tutorial you need to make sure that a MySQL database is running on your system.
Also, to interact with the MySQL database mentioned above, the following R package needs be installed using the following command: install.packages("RMySQL")
If the installation of this package fails and the error message is similar to this one: 
"ERROR: configuration failed for package ‘RMySQL’
* removing ‘/home/ubuntu/R/x86_64-pc-linux-gnu-library/3.6/RMySQL’
Warning in install.packages :
  installation of package ‘RMySQL’ had non-zero exit status"
Go to your terminal and execute the following statements:
sudo apt-get install libmariadbclient-dev libmariadb-client-lgpl-dev
sudo apt-get install libmysqlclient-dev
sudo apt-get install zlib1g-dev
After that, try again to install the RMySQL package.

In some lectures we will be covering somewhat advanced topics (e.g. 06_Functions.R) such "first order objects". However, these aspects are very useful to get a deep understanding of the R programming language.






