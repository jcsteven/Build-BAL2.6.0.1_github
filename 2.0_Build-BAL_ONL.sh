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
echo "==============================================================================" | tee -a $Record_File
echo "Start:ONL-Build-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File

cd ./${ONL_NAME}
echo "1. Build ONL "  | tee -a $Record_File
make amd64 
cd ..

e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee -a  $Record_File
echo "End  :ONL-Build-${TODAY}=> ${ONL_DIR}" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee -a  $Record_File
echo "==============================================================================" | tee -a  $Record_File





