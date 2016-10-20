# ubuntu-rvm 

Docker Image with Ruby Version Manager based on Ubuntu Trusty

View in DockerHub [siutin/ubuntu-rvm](https://hub.docker.com/r/siutin/ubuntu-rvm/)

View in GitHub  [siutin/ubuntu-rvm](https://github.com/siutin/ubuntu-rvm)

# Images Version

* v2.3.1_20161018
* v2.1.2_20161018

# How to use?

Verify version

```
docker run siutin/ubuntu-rvm:v2.3.1_20161018 /bin/bash -l -c 'lsb_release -a; rvm -v; ruby -v'
```

Execute ruby code directly
```
docker run siutin/ubuntu-rvm:v2.3.1_20161018 /bin/bash -l -c 'ruby -e "puts \"hello world\" "'
```

# Check also

[siutin/ubuntu-rails](https://github.com/siutin/ubuntu-rails)

[siutin/ubuntu-rails-apache-passenger](https://github.com/siutin/ubuntu-rails-apache-passenger)

[siutin/ubuntu-rails-apache-passenger](https://github.com/siutin/ubuntu-rails-apache-passenger)

[siutin/ubuntu-rails-apache-passenger-ssh](https://github.com/siutin/ubuntu-rails-apache-passenger-ssh)
