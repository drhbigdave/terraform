#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install oscap
yum update -y
yum install -y openscap-scanner scap-security-guide
oscap xccdf eval --remediate --profile  standard --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-amzn2-xccdf.xml
yum install -y java-1.8.0-openjdk

