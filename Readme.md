
# Samples for CSV - AS3

## Purpose

This repo provides a very rapid way of getting generating AS3 declarations from a CSV file

## Pre-req's

Docker

## Steps

* ### clone the repo

```
git clone git@github.com:arunhotra/GTH-AS3-sample.git

```

* ### build and run the container

``` docker-compose run csvas3```

If you get the following error

``` 

 docker.credentials.errors.InitializationError: docker-credential-gcloud not installed or not available in PATH
[75654] Failed to execute script docker-compose 

```
run the following command and then run docker compose again

```
rm  ~/.docker/config.json

```
* ### Once in the container, run the playbook using the following command.

``` ansible-playbook app.yml -e "role=tcp" ```

The samples generated will be in a newly created directory Files.



