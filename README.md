# Original RUBY.MN web site

## Installation

The easy way of setting up the RUBY.MN web site locally is by using Docker to set up a virtual environment on your computer.

### Windows Users
Installing Ruby on Rails directly in Windows is extremely difficult, and very
few people know how to do it.  It's best to install [VirtualBox](https://www.virtualbox.org/)
and create a Linux virtual machine for your Ruby on Rails installation.
Once you have done this, you can follow the instructions below for setting
up RUBY.MN in the Linux environment and bypass the need to learn the
Windows way.

### Install Git
Install [Git](http://www.git-scm.com/) on your computer.  If you are using Linux,
just use your routine package manager (such as Apt-Get for Debian and Ubuntu) to
install Git.  If you are using OS X, just download Git from the [Git](http://www.git-scm.com/)
web site and follow the normal software installation procedure.

### Install Docker
Install [Docker](https://www.docker.com/) on your computer.  If you have a
64-bit host system (whether OS X or Linux), go to the [Docker](https://www.docker.com/)
web site and follow the instructions.  If you have a 32-bit Linux host, go to
[https://github.com/jhsu802701/docker-32bit-debian-jessie-install](https://github.com/jhsu802701/docker-32bit-debian-jessie-install)
and follow the instructions.

### Switching from the Dash shell to Bash shell
* The scripts in the Docker repository (https://github.com/OpenTwinCities/docker-debian-jessie) used for accessing Docker require the use of Bash.  (The "sed" commands used in the setup.sh script do not work properly in Dash.)
* To check your default shell, enter the command "ls -l /bin/sh".
* To change your default shell to Bash, enter the following commands:
```
sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh
```

### Starting Docker
* Enter the following commands:
```
git clone https://github.com/jhsu802701/docker-debian-jessie
cd docker-debian-jessie
sh rbenv-rubymn.sh # Use 32rbenv-rubymn.sh instead if using a 32-bit system
cd rbenv-rubymn
sh download_new_image.sh
```
* After the Docker image has been downloaded, you will be in your Docker container.
Note that the contents of the shared directory are accessible through your Docker
container AND through your host system.  You can enter commands in your Docker container
and edit files in the shared directory through your preferred editor on your host system.
* OPTIONAL: Run the test scripts in the shared directory to set up basic starter
Rails apps.  These are the sanity checks used for making sure that the development
environment in the Docker container is working properly.

### Starting RUBY.MN
* Enter the command "tmux".  You will use one tmux window for running the local server and another tmux window for entering commands.
* Go to the /home/winner/shared directory, and git clone this repository.
* Use the cd command to enter the root directory of this app.  Enter the command "sh pg_setup.sh; sh server.sh".  You will be prompted for a username and password to use for the PostgreSQL databases.  After you have entered a username and password (which are NOT stored in the source code), the setup process will automatically proceed.  If all goes well, you will see all tests passing within a few minutes.  In the end, the first tmux window will be used for running the local server.
* To create a second tmux window, press "Ctrl-B" and then "c".  Enter "Ctrl-B" and then "p" to switch to the previous tmux window.  Press "Ctrl-B" and then "n" to switch to the next tmux window.  To get rid of a tmux window, terminate any tasks running within it, and enter the 
command "exit".
* In the second tmux window, enter the command "sh credentials.sh" to enter your Git credentials.
* After the first tmux window has finished running the pg_setup.sh script, you are ready to start working on this project in your second tmux window.

### Exiting the Docker Container
* In the Docker container, close all extra tmux windows.  After you have done this,
enter "exit" again to leave tmux.  Then enter "exit" one more time to exit the
Docker container.
* To re-enter the Docker container, run the resume.sh script.

### Resetting the Docker Container
* Follow the above procedure for exiting the Docker container.
* To reset as well as re-enter the Docker container, run the reset.sh script.
This returns the Docker container to the original conditions provided by the
Docker image.
* To set up RUBY.MN in the rebuilt Docker container, use the pg_setup.sh
script again.

### Updating the Docker Image
* Follow the above procedures for exiting the Docker container.
* Use the download_new_image.sh script to erase the current Docker image and
download the latest version to replace it.

### NOTES
* recaptcha has been removed from user validation. Optionally add this back in if invalid/spam user signups really are a problem.
* WARNING: ignoring activemailer delivery errors in production. This is because the new site is in a test mode. If merged back into the main site, will probably want to flip this back. This setting is in config/environments/production.rb.
* If running rake gives you the error message "ERROR: encoding UTF8 does not match locale en_US Detail: The chosen LC_CTYPE setting requires encoding LATIN1.", 
then you need to execute the following commands to correct this:
```
sudo -u postgres pg_dumpall > /tmp/postgres.sql
sudo pg_dropcluster --stop 9.1 main
sudo pg_createcluster --locale en_US.UTF-8 --start 9.1 main
sudo -u postgres psql -f /tmp/postgres.sql
```
