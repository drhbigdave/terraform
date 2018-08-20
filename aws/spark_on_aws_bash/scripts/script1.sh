#!/bin/bash

# sleep until instance is ready



wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda3
export PATH="$HOME/anaconda3/bin:$PATH"

mkdir $HOME/certs
mkdir $HOME/.jupyter

wget https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.rpm

sudo yum install -y scala-2.12.6.rpm

$HOME/anaconda3/bin/conda install -y pip

$HOME/anaconda3/bin/pip install -q py4j

wget http://www-us.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz

sudo tar -zxvf spark-2.3.1-bin-hadoop2.7.tgz

sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=*" -keyout /home/ec2-user/certs/mycert.pem -out /home/ec2-user/certs/mycert.pem



