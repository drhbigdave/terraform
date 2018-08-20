resource "aws_instance" "pyspark" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"

  #ssh key
  key_name = "${aws_key_pair.mykey.key_name}"

  #security group for ssh and 8888
  vpc_security_group_ids = ["${aws_security_group.spark.id}"]

  #bunch of bash stuff

  provisioner "file" {
    source = "scripts/script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  provisioner "file" {
    source = "scripts/script1.sh"
    destination = "$HOME/script1.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x $HOME/script1.sh",
      "$HOME/script1.sh"
    ]
  }

  provisioner "file" {
    source = "jupyter_notebook_config.py"
    destination = "$HOME/.jupyter/jupyter_notebook_config.py"
  }

  provisioner "file" {
    source = "scripts/script2.sh"
    destination = "$HOME/script2.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x $HOME/script2.sh",
      "$HOME/script2.sh"
    ]
  }

  connection {
    user = "${var.instance_username}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}

output "instance_ips" {
  value = ["${aws_instance.pyspark.*.public_ip}"]
}

resource "aws_ebs_volume" "data_vol" {
  availability_zone = "us-east-1a"
  type = "gp2"
  size              = 10
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.data_vol.id}"
  instance_id = "${aws_instance.pyspark.id}"
}