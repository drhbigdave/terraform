https://54.236.9.203:8888/?token=274ab2cebba9cb62aacbb1b428788fc89055eccfe4fa5bd3&token=274ab2cebba9cb62aacbb1b428788fc89055eccfe4fa5bd3


yum install -y openscap-scanner scap-security-guide
oscap xccdf eval --remediate --profile  standard --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-amzn2-xccdf.xml


yum install -y java-1.8.0-openjdk

wget https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.rpm

sudo yum install -y scala-2.12.6.rpm

$HOME/anaconda3/bin/conda install -y pip

$HOME/anaconda3/bin/pip install -q py4j

 wget http://www-us.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz

 sudo tar -zxvf spark-2.3.1-bin-hadoop2.7.tgz

~~~
export PATH=$PATH:$HOME/anaconda3/bin
export SPARK_HOME='$HOME/spark-2.3.1-bin-hadoop2.7'
export PATH=$HOME/spark-2.3.1-bin-hadoop2.7/bin:$PATH
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH


export PATH=$PATH:$HOME/anaconda3/bin
export SPARK_HOME='/home/ec2-user/spark-2.3.1-bin-hadoop2.7'
export PATH=$SPARK_HOME:$PATH
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH

on laptop
export SPARK_HOME='/opt/apache-spark/spark-2.3.0-bin-hadoop2.7/'
export PATH=$SPARK_HOME/bin:$PATH








provider "aws" {
  profile = "dhagan"
  region     = "us-east-1"
}

#!/bin/bash
yum install -y openscap-scanner scap-security-guide
yum update -y
oscap xccdf eval --remediate --profile  C2S --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-centos7-xccdf.xml


oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_rht-ccp --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml


xccdf_org.ssgproject.content_profile_standard
			xccdf_org.ssgproject.content_profile_pci-dss
			xccdf_org.ssgproject.content_profile_C2S
			xccdf_org.ssgproject.content_profile_rht-ccp
			xccdf_org.ssgproject.content_profile_common
			xccdf_org.ssgproject.content_profile_stig-rhel7-disa
			xccdf_org.ssgproject.content_profile_stig-rhevh-upstream
			xccdf_org.ssgproject.content_profile_ospp-rhel7
			xccdf_org.ssgproject.content_profile_cjis-rhel7-server
			xccdf_org.ssgproject.content_profile_docker-host
			xccdf_org.ssgproject.content_profile_nist-800-171-cui


Checklist version: 1.1
Imported: 2017-12-11T01:25:14
Status: draft
Generated: 2017-12-11
Resolved: true
Profiles:
	standard
	pci-dss
	C2S
	rht-ccp
	common
	stig-rhel7-disa
	stig-rhevh-upstream
	ospp-rhel7
	cjis-rhel7-server
	docker-host
	nist-800-171-cui

	oscap xccdf eval --remediate --profile : C2S --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-centos7-xccdf.xml

	ssg-centos7-ds.xml              ssg-firefox-xccdf.xml       ssg-rhel6-cpe-dictionary.xml  ssg-rhel7-cpe-oval.xml
ssg-centos7-xccdf.xml 

  provisioner "file" {
    source = "script2.sh"
    destination = "/tmp/script2.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script2.sh",
      "sudo /tmp/script2.sh"
    ]
  }

  resource "aws_security_group" "tf_ssh" {
  name        = "tf_ssh"
  description = "managed by tf ssh only"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = 
  }

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = ["
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}