#!/usr/bin/env bash

set -x

apt install sudo

useradd -Um ansible  -s `which bash`

mkdir -p /home/ansible/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4qmq3rqpRhnGTeAQ4j6MyfxJbZn4AQiQ4MXaN/gMdT9/W46ab2ASUZjJbWRi5JGRbyQDDa0UnPOjhS8HnC/0fSpTrYJBgnMznZKeTIOpw8vkBx0zFk7/Z47M7PZ9Tz96iu6ynPoq3Ew3COUfXGBAGTYOyIkuTxQML+I0fV3S3M/yUAS3aZcgHxVhJh1lLwJq58pb/IJi7ACfCl+XNIrfecUPn9b0CqRcpbVTaUxI6bTtNQo0mhGe5xTksXLZ9h40ZlB3xAIttYSc+1EgFuQMnWht2Zl/sxb1HCeCqryIhVI8Do5iFkTqtm3oW2sbw4iDiXKXCiS9pvoEknLfeSa3a45jd9QwdnyvlChhYFdfNHiliI4fhj3tD1gFLSlACF7Ke/JNxLeSUHh9apAi788ch+fZloXrI3irr0E+7NjDa3JS9UEX1x2nDGRPOkhGIPF2o0pbMr1k3NW5IVoDqvOBmlbZJGCU4e3CqaC9meuQpE1SSNVYG+5FIHrmaQ549VYU= root@deployment-server" > /home/ansible/.ssh/authorized_keys

mkdir -p /etc/sudoers.d
echo "ansible ALL=(ALL) NOPASSWD: ALL" > /tmp/tmp_sudoers
visudo -c -q -f /tmp/tmp_sudoers
mv /tmp/tmp_sudoers /etc/sudoers.d/ansible
chmod 440 /etc/sudoers.d/ansible

set +x
