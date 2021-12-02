#!/bin/bash
# @author Markus Bader

#Usage message
CAMERA=$1
USER=$2
PASSWORD=$3
PREFIX=camera
DESTINATION="$(pwd)"
TEMP_FOLDER=/tmp
IMAGE_TMP=${PREFIX}-tmp.jpg

echo "usage:   "$0" <ip_camera>  <user> <password> <prefix> <destination> <temp_folder>" 
echo "-----------------------------------------"
echo "example: "$0" 192.168.16.90  admin xyz /srv/data/ camera0 /tmp" 
echo "$#"
if    (( "$#" < 3 )); then
    echo "Illegal number of parameters"
    exit
fi

if  (( "$#" > 3 )); then
    PREFIX=$4
fi

if  (( "$#" > 4 )); then
    DESTINATION=$5
fi

if  (( "$#" > 5 )); then
	TEMP_FOLDER=$6
fi


echo "ip_camera:   ${CAMERA}"
echo "user:        ${USER}"
echo "password:    ${PASSWORD}"
echo "prefix:      ${PREFIX}"
echo "destination: ${DESTINATION}"
echo "temp_folder: ${TEMP_FOLDER}"
echo "--------------------------------------------"
    
API="api.cgi?cmd=Snap&channel=0&rs=wuuPhkmUCeI9WG7C&user=${USER}&password=${PASSWORD}"
CWD="$(pwd)"
cd ${TEMP_FOLDER}
wget -m -p -k "http://${CAMERA}/cgi-bin/${API}"
echo "mv ${CAMERA}/cgi-bin/api.cgi* ${DESTINATION}/${IMAGE_TMP}"
mv ${CAMERA}/cgi-bin/${API} ${DESTINATION}/${IMAGE_TMP}
cd ${DESTINATION}
exiftool -overwrite_original  "-CreateDate<FileModifyDate" ${IMAGE_TMP}
exiftool ${IMAGE_TMP} '-FileName<CreateDate'  -ext jpg -d "${PREFIX}--%Y-%m-%d--%H-%M-%S-%%-.c.%%e"
cd ${CWD}
