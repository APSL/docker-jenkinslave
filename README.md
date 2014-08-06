=============
Jenkins slave
=============

Jenkins slave for python builds. Based on apsl/circusbase. sshd run by circus.

Description
===========

Jenkins  slave image for python projects. Intended for Use as a base image.
Runs sshd needed for jenkins slave with docker cloud plugin:
https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin

Default unsecure ssh key at  conf/jenkinslave.pub
private key at 
Change it on inherited Dockerfile

* circus to control processes. http://circus.readthedocs.org/
* envtpl to configure parameters
* sshd

See base image *apsl/circusbase* for more info:

https://registry.hub.docker.com/u/apsl/circusbase/
https://github.com/APSL/docker-circusbase

