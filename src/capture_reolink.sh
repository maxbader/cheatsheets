#!/bin/sh
# @author Markus Bader
# @email markus.bader@mx-robotics.com

#Usage message
SRC_FOLDER=$1
CAMERA=192.168.16.90
USER=server
PW=DwM3IqsvpE4Z7IliwNqK
PREFIX=camera0

echo "usage: "$0" <folder>" 
echo "-----------------------------------------"
echo ""
wget -m -p -k "http://${CAMERA}/cgi-bin/api.cgi?cmd=Snap&channel=0&rs=wuuPhkmUCeI9WG7C&user=${USER}&password=${PW}"
IMAGE_TMP=${PREFIX}.jpg
mv ${CAMERA}/cgi-bin/api.cgi* ${IMAGE_TMP}
exiftool -overwrite_original  "-CreateDate<FileModifyDate" ${IMAGE_TMP}
exiftool ${IMAGE_TMP} '-FileName<CreateDate'  -ext jpg -d "${PREFIX}--%Y-%m-%d--%H-%M-%S-%%-.c.%%e"

