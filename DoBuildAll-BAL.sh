#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for rtk_openwrt 
# JC Yu,     Novenber 26,2015
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
TODAY=`date +"%Y-%m%d-%H%M"`
source build_comm-BAL.sh

[ -d $BLOG_DIR_WK ] || mkdir $BLOG_DIR_WK
s_time=$(date +%s)
echo "..............................................................................." | tee -a $Record_File
echo "Start:All-Build-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File

TO_BUILD_ALL="y"
if [[ "${TO_BUILD_ALL}" == "y" ]]; then
	echo "1. Build Maple SDK"
	BUILD_DIR=./${ONL_NAME}/${BAL_NAME}/bal_release
	if [ ! -d ${BAL_BUILD_DIR} ]; then
	   echo $LINENO "missing ${BAL_BUILD_DIR}" |  tee -a $Record_File
	   exit -1
	fi			
	cd ${BUILD_DIR}

	make BOARD=asfvolt16 maple_sdk_dir
	make BOARD=asfvolt16 maple_sdk
	make BOARD=asfvolt16 switch_sdk_dir
	#tar zxvf ../../Diag_files/sdk-all-6.5.7.tgz -C 3rdparty/bcm-sdk/build-asfvolt16/
	make BOARD=asfvolt16 switch_sdk
	cd 3rdparty/bcm-sdk/build-asfvolt16/sdk-all-6.5.7/systems/linux/user/x86-generic_64-2_6
	KERNDIR=${ONL_DIR}/packages/base/amd64/kernels/kernel-4.14-lts-x86-64-all/builds/jessie/linux-4.14.49  BOARD=asfvolt16 ARCH=x86_64 SDKBUILD=build_bcm_user make
	cd ../../../../../../../../
	make BOARD=asfvolt16 bal
	make BOARD=asfvolt16 release_board
	cd ../../../
fi

e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee -a  $Record_File
echo "End  :All-Build-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee -a  $Record_File
echo "==============================================================================" | tee -a  $Record_File	