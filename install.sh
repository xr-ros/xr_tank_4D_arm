project_path=$(cd `dirname $0`; pwd)
project_name="${project_path##*/}"

echo work_dir is $project_name

if [ $project_name != "xr_tank_4D_arm" ]
then
	echo work in network mode
	cd ~/Desktop

	git clone https://gitee.com/xr-ros/xr_tank_4D_arm

	if [ ! $! -eq 0 ]
	then 
		echo git failed, check your network.
		exit -1
	fi

	cd xr_tank_4D_arm
else
	echo work in local mode
fi

if [ ! -d ~/moveit_ws/src ] 
then
	echo source dir not exsit, creat is now.
	mkdir -p ~/moveit_ws/src
fi

echo cp sorce file

cp -r tank_arm ~/moveit_ws/src/
cp -r moveit_arm ~/moveit_ws/src/
cp -r xr_arm_publisher/ ~/moveit_ws/src/

echo build source
cd ~/moveit
catkin_make

echo install success
