#!/bin/bash
# A Simple Bash Script
read -p "Enter Robot Serial Number: " serial
read -p "Enter Four Digit Robot Number: " number
read -p "Enter Lastpass Password: " password
mkdir -p /home/fetch/$number
#password="Enter Lastpass Password for $serial"
echo $serial
echo "------------------copy from local to remote----------------"

#-----------------create directory at remote home location----------------
sshpass -p "$password" ssh $serial mkdir -p /home/fetch/$number

#-----------------copy from local home directory to remote home directory----------------
sshpass -p "$password" scp -o StrictHostKeyChecking=no /home/fetch/$number/camera_extrinsic_calibration_date $serial:/home/fetch/$number

#-----------------copy from remote home directory to remote fetchcore directory----------------
ssh -t fetch@freight100-1904 "sudo mv /home/fetch/camera_extrinsic_calibration_date /etc/fetchcore"

echo "Copying Files are Completed"
