#!/bin/bash

sudo systemctl start sshd
sudo mkdir -p /mnt/pc
sudo sshfs -o allow_other jorge1504@192.168.100.14:/home/jorge1504 /mnt/pc
