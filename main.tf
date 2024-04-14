provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "my_instance" {
  ami = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
user_data = <<-EOF
#!/bin/bash
echo "Hello, World" > index.xhtml
nohup busybox httpd -f -p 8080 &
EOF
user_data_replace_on_change = true
  
  tags = {
    Name = "terraform-example"
  }
}