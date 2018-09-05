This the build scrip for: Build-BAL2.6.0.1_gitgub-V201808150304
b2- 2018-0904
modify the ONL github to https://github.com/jcsteven/OpenNetworkLinux.git -b asxvolt16
b1- 2018-0901
modify the ONL github to https://github.com/jcsteven/OpenNetworkLinux.git
b0- 2018-0731

NDA files required from BROADCOM
1. ~/broadcom/download/sdk-all-6.5.7.tar.gz
2. ~/broadcom/download/SW-BCM68620_2_6_0_1_github.zip
3. ~/edgecore/download/ACCTON_BAL_2.6.0.1_github-V201808150303

HowToBuild
1 Prepare the requied for build the ONL and BAL
 $./1.0_Build-BAL-Prepare.sh
 
 Note:
   A. The default script is not to update the ONL Source.
      So, if you want to git update the ONL source, be sure to add [TO_UPDATE_ONL="y"]
 
2. Get in Docker environment
  $ cd OpenNetworkLinux/
  $ docker/tools/onlbuilder -8
  $ apt-cacher-ng
  $ source setup.env
  $ cd ..
  
3. Run the scrip o build code
  $ ./2.0_Build-BAL_ONL.sh
  $ ./2.1_Build-BAL_Maple.sh 
  $ ./2.2_Build-BAL_Qumran.sh 
  $ ./2.3_Build-BAL_API_Applicatio.sh 
  $ ./2.4_Build-BAL_Board_Release_File.sh

4. To copy ONL and BAL package in the folder in md64-<build date>-BAL-Build  
  $ ./3.0_Build-BAL_Copy_Image.sh  
==============================================
