Will deploy Anaconda 3, Java 8 JRE and Scala. 

Output isn't awesome as it's all installed via bash, the last bash script stays open in Terraform. But you'll have the public IP and the URL with token there in the command line output. You'll have to use Chrome to connect to it as the cert is self signed so you'll have to click Advanced and permit the site to open. 

You can control - c the Terraform apply. Currently it will cutoff an aws_ebs_attachment, but it's not needed right now. I'll get that fixed soon.

create a terraform.tfvars with valid entries for the following 

aws_profile = "" #if you use aws profiles 

home_ip = "" #will open SG to this IP

vpc_id = "" # I didn't deploy the VPC and entire account with Terraform, so just supplied the vpc id here

instance_username = ""  #made a variable as sometimes I use spel, sometimes Amazon 

ctrl c to 