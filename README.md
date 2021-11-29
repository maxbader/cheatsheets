# exif_image_cheatsheet


## Rename images based on exifdate
### Check which exif tag/entry/date you like to with
```
exiftool -s -G image.jpg
```
Examples:
```
exiftool 2*_*.jpg '-FileName<FileModifyDate'    -ext jpg -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
exiftool 2*_*.jpg '-FileName<CreateDate'        -ext jpg -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
```
It works also with movies/videos
```
exiftool 2*_*.mp4 "-FileName<CreateDate"       -ext mp4 -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
```
### Copy dates
```
exiftool "-CreateDate<FileModifyDate" *
```
### Resize
resizing images using multiple cores
```
find . -name "*.jpg" | parallel -j10  --progress --bar mogrify -quality 90%
```
