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
echo "Start:2.4 Board Release File Build-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File

TO_BUILD_BOARD_RELEASE_FILE1="y"
if [[ "${TO_BUILD_BOARD_RELEASE_FILE1}" == "y" ]]; then
	echo "2.4.a Build the Board release files"
	BUILD_DIR=./${ONL_NAME}/${BAL_NAME}/bal_release
	if [ ! -d ${BAL_BUILD_DIR} ]; then
	   echo $LINENO "missing ${BAL_BUILD_DIR}" |  tee -a $Record_File
	   exit -1
	fi			
	cd ${BUILD_DIR}
	
	make BOARD=asfvolt16 release_board
	cd ../../..
fi

e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee -a  $Record_File
echo "End  :2.4 Board Release File Build-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee -a  $Record_File
echo "==============================================================================" | tee -a  $Record_File






