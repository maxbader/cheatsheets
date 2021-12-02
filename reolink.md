# Captuer raw images form reolink camera (non akku versions)
`wget` can be used to captuer a image 
```
wget -m -p -k "http://${IP_CAMERA}/cgi-bin/api.cgi?cmd=Snap&channel=0&rs=wuuPhkmUCeI9WG7C&user=${USER}&password=${PASSWORD}"
```
If you like to get more details you can run the following lines or checkout the [script](./src/capture_reolink.sh') 
```
export IP_CAMERA=192.168.16.90
export USER=admin
export PASSWORD=xy

wget -m -p -k "http://${IP_CAMERA}/cgi-bin/api.cgi?cmd=Snap&channel=0&rs=wuuPhkmUCeI9WG7C&user=${USER}&password=${PASSWORD}"
mv ${IP_CAMERA}/cgi-bin/api.cgi* camera.jpg
exiftool -overwrite_original  "-CreateDate<FileModifyDate" camera.jpg
exiftool camera.jpg '-FileName<CreateDate'  -ext jpg -d "${PREFIX}--%Y-%m-%d--%H-%M-%S-%%-.c.%%e"
```

