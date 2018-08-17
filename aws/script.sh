#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
yum update -y
yum install -y nginx
yum install -y openscap-scanner scap-security-guide
oscap xccdf eval --remediate --profile  C2S --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-rhel7-xccdf.xml


# make sure nginx is started
systemctl start nginx