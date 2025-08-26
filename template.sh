#!/bin/bash
yum update -y
yum install -y httpd git
systemctl start httpd
systemctl enable httpd
usermod -aG apache ec2-user
chmod 755 /var/www/html
cd /var/www/html
git clone https://github.com/atulkamble/aws-ec2-s3-static-website.git
cp -r aws-ec2-s3-static-website/* /var/www/html/
echo "<h1>Hello from $(hostname -f) webserver</h1>" >> /var/www/html/index.html
