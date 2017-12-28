
Install from a package

If you cannot use Docker’s repository to install Docker CE, you can download the .deb file for your release and install it manually. You will need to download a new file each time you want to upgrade Docker CE.

    Go to https://download.docker.com/linux/ubuntu/dists/, choose your Ubuntu version, browse to pool/stable/ and choose amd64, armhf, ppc64el, or s390x. Download the .deb file for the Docker version you want to install.

        Note: To install an edge package, change the word stable in the URL to edge. Learn about stable and edge channels.

    Install Docker CE, changing the path below to the path where you downloaded the Docker package.

    $ sudo dpkg -i /path/to/package.deb

    The Docker daemon starts automatically.

    Verify that Docker CE is installed correctly by running the hello-world image.

    $ sudo docker run hello-world

    This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker CE is installed and running. The docker group is created but no users are added to it. You need to use sudo to run Docker commands. Continue to Post-installation steps for Linux to allow non-privileged users to run Docker commands and for other optional configuration steps.
Upgrade Docker CE

To upgrade Docker CE, download the newer package file and repeat the installation procedure, pointing to the new file.
Install using the convenience script

Docker provides convenience scripts at get.docker.com and test.docker.com for installing edge and testing versions of Docker CE into development environments quickly and non-interactively. The source code for the scripts is in the docker-install repository. Using these scripts is not recommended for production environments, and you should understand the potential risks before you use them:

    The scripts require root or sudo privileges in order to run. Therefore, you should carefully examine and audit the scripts before running them.
    The scripts attempt to detect your Linux distribution and version and configure your package management system for you. In addition, the scripts do not allow you to customize any installation parameters. This may lead to an unsupported configuration, either from Docker’s point of view or from your own organization’s guidelines and standards.
    The scripts install all dependencies and recommendations of the package manager without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
    The script does not provide options to specify which version of Docker to install, and will install the latest version that is released in the “edge” channel.
    Do not use the convenience script if Docker has already been installed on the host machine using another mechanism.

This example uses the script at get.docker.com to install the latest release of Docker CE on Linux. To install the latest testing version, use test.docker.com instead. In each of the commands below, replace each occurrence of get with test.

    Warning:

    Always examine scripts downloaded from the internet before running them locally.

$ curl -fsSL get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

<output truncated>

If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:

  sudo usermod -aG docker your-user

Remember that you will have to log out and back in for this to take effect!

WARNING: Adding a user to the "docker" group will grant the ability to run
         containers which can be used to obtain root privileges on the
         docker host.
         Refer to https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
         for more information.

Docker CE is installed. It starts automatically on DEB-based distributions. On RPM-based distributions, you need to start it manually using the appropriate systemctl or service command. As the message indicates, non-root users are not able to run Docker commands by default.
Upgrade Docker after using the convenience script

If you installed Docker using the convenience script, you should upgrade Docker using your package manager directly. There is no advantage to re-running the convenience script, and it can cause issues if it attempts to re-add repositories which have already been added to the host machine.
