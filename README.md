### Requirements

- [Vagrant](http://www.vagrantup.com/downloads.html)

####Getting Started
Edit templates/app@.service to run the appropriate docker which contains the application to cluster.

```
vagrant up --provision
vagrant ssh core-01

// inside core-01
// starts all the symlink services of app on different ports
> fleetctl start share/instances/*
// starts nginx service which starts the nginx docker
> fleetctl start share/static/*

// see where each service is running
> fleetctl list-units
```
