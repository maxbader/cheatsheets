# exif_image_cheatsheet


## Rename images based on exifdate
# check which exifentry you like to with
``
exiftool -s -G image.jpg
```
Examples:
```
exiftool I*.jpg '-FileName<FileModifyDate'    -ext jpg -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
exiftool I*.jpg '-FileName<CreateDate'        -ext jpg -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
```
