#!/bin/bash
# Base Script to export calibration files for final qual to appropriate robot locations
# This Script only being used when the robot is final qualed and want to qualed again
# this Script should perform after Reimage the Robot

# Created by Abhi Adhuria

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
sshpass -p "$password" scp -o StrictHostKeyChecking=no /home/fetch/$number/camera_extrinsic_calibration_date $serial:/home/fetch

#-----------------copy from remote home directory to remote fetchcore directory----------------
sshpass -p "$password" ssh -t -o StrictHostKeyChecking=no fetch@freight100-1904 "echo $password | sudo -S mv /home/fetch/camera_extrinsic_calibration_date /etc/fetchcore"

echo "Copying Files are Completed"
