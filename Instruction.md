# Start Application instruction

### 1. What do we expect?

Application will be automatically build in docker image via CI process.

Docker image will be run in VM machine, created by Vagrant.

### 2. Prerequisites
- installed **Vagrant**, **Oracle VM VirtualBox** and **Git** - if you want only automatically create VM machine with  our application running in Docker.

- installed **Jenkins** (with docker configured) and **dockerhub account** - if you want build your own image and push it to registry.

### 3. Clone git repository

`git clone https://github.com/pmisiek/spa.git`

### 4. Start environment

In cloned repository root directory make a command `vagrant up`.
It will use `Vagrantfile` and deploy VM machine, install docker on it and run *pmisiek/spa-app-image* docker image.

We will use port-forwarding so application will be available on http://localhost:8081 (port can be changed in Vagrantfile).

### 5. Build docker Image

If someone wants to build his own image, I provide Jenkinsfile.
Pipeline checkouts code repository, builds image with tag (build number) and pushes image to `https://hub.docker.com`. There is more explanation and some tips in Jenkinsfile (comments).
