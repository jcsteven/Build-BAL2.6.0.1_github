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
echo "==============================================================================" |  tee -a $Record_File
echo "Build: Build Start:Clean Folders:${TODAY}=> ${ONL_DIR}" | tee -a $Record_File

#----Prepare workspace for BAL
TO_PREPARE_BAL="y"
if [[ "${TO_PREPARE_BAL}" == "y" ]]; then
	if [ ! -d ${ONL_DIR} ]; then
	   echo $LINENO "missing ${ONL_DIR}" |  tee -a $Record_File
	   exit -1
	fi	

	cd ${PPWW}/${ONL_NAME}
	rm -rf ./${BAL_NAME}
	cd ${PPWW}
fi



#--- Check out the specified ONL code from git Hub
#TO_UPDATE_ONL="y"
if [[ "${TO_UPDATE_ONL}" == "y" ]]; then
sudo rm -rf  ./${ONL_NAME}
fi


e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee -a $Record_File
echo "Build: Build End:Clean Folders:${TODAY}=> ${ONL_DIR}" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee -a $Record_File
echo "==============================================================================" | tee -a $Record_File
