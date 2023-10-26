# Simple printing service
A simple python script that is printing an environment variable at regular intervals

## Table of contents
- [Introduction](#introduction)
- [Makefile](#features)

## Introduction
This project includes:
- A script that is printing environment variable value at regular intervals
- Makefile
- Unit tests
- Dockerfile
- Kubernetes infrastructure for the project image
- Helm chart for the kubernetes service
- Terraform that launches an EKS cluster, where the helm chart can be installed
- CI/CD GitHub actions

## Makefile
#### install
Installs the necessary dependencies for the project

#### help
list the help menu of the script

#### start
starts the script

#### build
builds local docker image of the project

#### container.start: runs the local docker image

#### k8s.start
applies the kubernetes infrastructure to the configured kubernetes cluster

#### k8s.stop
deletes the kubernetes infrastructure to the configured kubernetes cluster

#### helm.start
applies the helm chart of the project

#### helm.upgrade
upgrades the helm chart of the project

#### helm.stop
uninstalls the helm chart of the project

#### test
runs the unit tests

#### tfinit
initializes the terraform directory

#### tfplan
runs terraform plan operation

#### tfapply
runs terraform apply operation

#### tfdestroy:
runs terraform destroy operation

#### style:
formats the .py and .tf files in the project