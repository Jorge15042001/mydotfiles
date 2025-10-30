#!/bin/bash
printf "yes\nUsuarios-ESPOL\njvulgari@espol.edu.ec\n$(pass show espol/espol/personal)" | sudo openconnect vpn.espol.edu.ec
