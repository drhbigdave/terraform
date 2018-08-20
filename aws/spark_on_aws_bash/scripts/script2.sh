#!/bin/bash


export PATH=$PATH:$HOME/anaconda3/bin
export SPARK_HOME='/home/ec2-user/spark-2.3.1-bin-hadoop2.7'
export PATH=$SPARK_HOME:$PATH
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH

jupyter notebook

exit
