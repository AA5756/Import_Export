#!/bin/bash
# Base Script to import calibration files for final qual from appropriate robot locations to local desktop
# This Script only being used when the robot is final qualed and want to qualed again
# this Script should perform before Reimage the Robot

# Created by Abhi Adhuria

read -p "Enter Robot Serial Number: " serial
read -p "Enter Four Digit Robot Number: " number
read -p "Enter Lastpass Password: " password

## Follownig Code create directory in local machine by Robot Serial Number date
mkdir -p /home/fetch/$number

#Following Code is to get Copy Extrinsic and Gyro Calibration file from Robot to local mahcine 
echo $serial
sshpass -p "$password" scp -o StrictHostKeyChecking=no $serial:/etc/fetchcore/calibrated_urdf.urdf /home/fetch/$number/
sshpass -p "$password" scp -o StrictHostKeyChecking=no $serial:/etc/fetchcore/camera_extrinsic_calibration_date /home/fetch/$number/
sshpass -p "$password" scp -o StrictHostKeyChecking=no $serial:/etc/ros/indigo/robot.launch /home/fetch/$number/
sshpass -p "$password" scp -o StrictHostKeyChecking=no $serial:/etc/ros/noetic/robot.launch /home/fetch/$number/noetic_robot.launch
echo "Copying Files are Completed"
