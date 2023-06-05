#!/bin/bash
sudo systemctl start sshd
sudo mkdir -p /mnt/laptop
sudo sshfs -o allow_other jorge1504@192.168.100.41:/home/jorge1504/ /mnt/laptop/
