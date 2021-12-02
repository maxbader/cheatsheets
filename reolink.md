# Captuer raw images form reolink camera (non akku versions)

```bash
#!/bin/sh
# @author Markus Bader

#Usage message
CAMERA=$1
USER=$2
PASSWORD=$3
DESTINATION=$4
PREFIX=$5
TEMP_FOLDER=$6
IMAGE_TMP=${PREFIX}-tmp.jpg

echo "usage:   "$0" <ip_camera>  <user> <password> <destination> <prefix> <temp_folder>" 
echo "-----------------------------------------"
echo "example: "$0" 192.168.16.90  server xy /srv/data/ camera0 /tmp" 
CWD="$(pwd)"
cd TEMP_FOLDER
wget -m -p -k "http://${CAMERA}/cgi-bin/api.cgi?cmd=Snap&channel=0&rs=wuuPhkmUCeI9WG7C&user=${USER}&password=${PASSWORD}"
mv ${CAMERA}/cgi-bin/api.cgi* ${DESTINATION}/${IMAGE_TMP}
cd ${DESTINATION}
exiftool -overwrite_original  "-CreateDate<FileModifyDate" ${IMAGE_TMP}
exiftool ${IMAGE_TMP} '-FileName<CreateDate'  -ext jpg -d "${PREFIX}--%Y-%m-%d--%H-%M-%S-%%-.c.%%e"
cd ${CWD}
```
