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
echo "Start:2.5  BAL_Build-Copy Image-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File

IMAGE_NAME=amd64-${TODAY}-BAL-Build
[ -d ./${IMAGE_NAME} ] || mkdir -p ./${IMAGE_NAME} 

TO_COPY_ONL_IMAGE="y"
if [[ "${TO_COPY_ONL_IMAGE}" == "y" ]]; then
	echo "To Copy ONL Image File."
	BUILD_DIR1=./${ONL_NAME}/RELEASE/jessie/amd64
	if [ ! -d ${BUILD_DIR1} ]; then
	   echo $LINENO "missing ${BUILD_DIR1}" |  tee -a $Record_File
	   exit -1
	fi		
	#-- Create build imgage folder
    #cp ${BUILD_DIR1}/ONL-2.0.0_ONL-OS_*_AMD64_INSTALLED_INSTALLER ./${IMAGE_NAME}
    #cp ${BUILD_DIR1}/ONL-master_ONL-OS_*_AMD64_INSTALLED_INSTALLER ./${IMAGE_NAME}
    cp ${BUILD_DIR1}/ONL-asxvolt16_ONL-OS_*_AMD64_INSTALLED_INSTALLER ./${IMAGE_NAME}
fi 

TO_COPY_BAL_IMAGE="y"
if [[ "${TO_COPY_BAL_IMAGE}" == "y" ]]; then 
	echo "To Copy BAL Image File."	
	#BUILD_DIR2=./${ONL_NAME}/${BAL_NAME}/bal_release/3rdparty/maple/cur/asfvolt16/release
	BUILD_DIR2=./${ONL_NAME}/${BAL_NAME}/bal_release/3rdparty/bcm-sdk/rc/asfvolt16/release
	if [ ! -d ${BAL_BUILD_DIR} ]; then
	   echo $LINENO "missing ${BUILD_DIR2}" |  tee -a $Record_File
	   exit -1
	fi			
	
	#-- Create build imgage folder
    cp ${BUILD_DIR2}/*.tar.gz ./${IMAGE_NAME}
fi


e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee  -a  $Record_File
echo "End  :Start:2.5  BAL_Build-Copy Image-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee  -a  $Record_File
echo "==============================================================================" | tee  -a  $Record_File






