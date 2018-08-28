#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install oscap
yum update -y

yum install -y java-1.8.0-openjdk

