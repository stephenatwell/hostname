
provider "aws" {
      region = "us-east-2"
    }

    resource "aws_spot_instance_request" "example" {
      # a free-to-use Ubuntu 18.04 AMI in us-east-2
      ami           = "ami-0c55b159cbfafe1f0"
      instance_type = "t3.nano"
      user_data = <<-EOF
                  #!/bin/bash
                  echo "Hello, World" > index.html
                  nohup busybox httpd -f -p 8080 &
                  EOF
      spot_price = "0.0052"
      tags = {
        Name = "TempInstance20210326",
        Owner="stephenatwell"
      }
    }
