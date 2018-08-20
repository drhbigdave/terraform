resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

#Instance

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  #public? key for ssh
  key_name = "${aws_key_pair.mykey.key_name}"

  #security group 
  vpc_security_group_ids = ["${aws_security_group.spark.id}"]

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
}

resource "aws_ebs_volume" "data_vol" {
  availability_zone = "us-east-1a"
  type = "gp2"
  size              = 10
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.data_vol.id}"
  instance_id = "${aws_instance.example.id}"
}