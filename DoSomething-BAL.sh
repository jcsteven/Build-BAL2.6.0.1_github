#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for rtk_openwrt 
# JC Yu,     Novenber 26,2015
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
./2.0_Build-BAL_ONL.sh
./2.1_Build-BAL_Maple.sh
./2.2_Build-BAL_Qumran.sh
./2.3_Build-BAL_API_Application.sh
./2.4_Build-BAL_Board_Release_File.sh




