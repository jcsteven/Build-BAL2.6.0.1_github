#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for rtk_openwrt 
# JC Yu,     Novenber 26,2015
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
#TODAY=`date +"%Y-%m%d-%H%M"`
:${PPWW:=`pwd`}
#--2017-1117
#:${CMM_ID:=166c116414a5ff5f504e0dce449db5b6916ed674} 
#:${CMM_DATE:=2017-1117}

#--2017-1228
:${CMM_ID:=1303f2080419b8ed3add4161d7d1a31bab793b5b} 
:${CMM_DATE:=2017-1228}


#ONL_GIT_NAME="https://github.com/Lewis-Kang/OpenNetworkLinux.git"
ONL_GIT_NAME="https://github.com/jcsteven/OpenNetworkLinux.git"
ONL_GIT_B=asxvolt16
ONL_NAME=OpenNetworkLinux
ONL_DIR=${PPWW}/${ONL_NAME}

BAL_NAME=bal_src_release
BAL_DIR=${ONL_DIR}/${BAL_NAME}
BAL_BUILD_DIR=${ONL_DIR}/${BAL_NAME}/bal_release

ASFVOLT_GIT_NAME="https://gerrit.opencord.org/asfvolt16-driver"
ASFVOLT_B=1.2.0
#ASFVOLT_DRV_NAME=asfvolt16-driver-b${ASFVOLT_DRV_B}
ASFVOLT_DRV_NAME=asfvolt16-driver
ASFVOLT_DRV_DIR=${ONL_DIR}/${ASFVOLT_DRV_NAME}


VOLTHA_GIT_NAME="https://gerrit.opencord.org/voltha"
VOLTHA_B=1.2.0
#VOLTHA_NAME=voltha-b${VOLTHA_B}
VOLTHA_NAME=voltha
VOLTHA_INCUBATOR_DIR1=${PPWW}/cord
VOLTHA_INCUBATOR_DIR=${VOLTHA_INCUBATOR_DIR1}/incubator
VOLTHA_DIR=${VOLTHA_INCUBATOR_DIR}/${VOLTHA_NAME}

BROADCOM_DOWNLOAD_DIR=${HOME}/broadcom/download
EDGECORE_DOWNLOAD_DIR=${HOME}/edgecore/download
: ${BALSRC_ZIPNAME:=SW-BCM68620_2_6_0_1_github.zip}

: ${SWISDK_TARNAME:=sdk-all-6.5.7}
: ${PATCH_FILENAME:=ACCTON_BAL_2.6.0.1_github-V201808150305.patch}


BLOG_DIR="Build-log"
BLOG_DIR_WK=${HOME}/${BLOG_DIR}
Record_File=${BLOG_DIR_WK}/onl-bal-log.txt

echo "PPWW=${PPWW}"
echo "CMM_ID=${CMM_ID}"
echo "CMM_DATE=${CMM_DATE}"

echo "ONL_GIT_NAME=${ONL_GIT_NAME}"
echo "ONL_GIT_B=${ONL_GIT_B}"
echo "ONL_NAME=${ONL_NAME}"

echo "ASFVOLT_GIT_NAME=${ASFVOLT_GIT_NAME}"
echo "ASFVOLT_B=${ASFVOLT_B}"
echo "ASFVOLT_DRV_NAME=${ASFVOLT_DRV_NAME}"

echo "VOLTHA_GIT_NAME=${VOLTHA_GIT_NAME}"
echo "VOLTHA_B=${VOLTHA_B}"
echo "VOLTHA_NAME=${VOLTHA_NAME}"
echo "VOLTHA_INCUBATOR_DIR=${VOLTHA_INCUBATOR_DIR}"

echo "BROADCOM_DOWNLOAD_DIR=${BROADCOM_DOWNLOAD_DIR}"
echo "EDGECORE_DOWNLOAD_DIR=${EDGECORE_DOWNLOAD_DIR}"
echo "BALSRC_ZIPNAME=${BALSRC_ZIPNAME}"
echo "SWISDK_TARNAME=${SWISDK_TARNAME}"
echo "PATCH_FILENAME=${PATCH_FILENAME}"

echo "BLOG_DIR=${BLOG_DIR}"
echo "BLOG_DIR_WK=${BLOG_DIR_WK}"
echo "Record_File=${Record_File}"



