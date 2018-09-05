#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for rtk_openwrt 
# JC Yu,     Novenber 26,2015
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
#source comm.sh
# Change the the time zone
#echo 'Asia/Taipei' | sudo tee /etc/timezone

# Change the localtime 
sudo rm -f /etc/localtime
sudo ln -s /usr/share/zoneinfo/ROC /etc/localtime 
