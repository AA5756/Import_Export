# Import_Export
Getting Calibration file from remote to local and local to Remote

Problem Code: The robot coming from flex are final qualed so assigning those robots for sales order san Jose team needs to perform reimage again 
Once we reimage it will delete all the calibration file and it becase the robot is already tested we only need to perform perform the extrinsic camera test and 
gyro test again to do the final qual.

Solution: to make it easy I create two bash scripts one needs to be run before reimaging "import_final_qual" and one after reimaging "export_final_qual",
using this we can get calibration files from the robot to the local machine and copy them back to the robot after reimage is done,
by doing this we don't need to perform both tests again and we only have to enter the last pass password one time.
Which reduce some amount of time and just straight perform reimage then final qual.
