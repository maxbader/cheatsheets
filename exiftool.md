# exif_image_cheatsheet


## modify images based on exif data
View exit tags
```bash
exiftool -s -G image.jpg
```
### Rename based on exif date 
Examples:
```bash
find -name '*.JPG' -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; 
find -name '*.JPEG' -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; 
rename 's/.jpeg/.jpg/' *
exiftool 2*_*.jpg '-FileName<CreateDate'        -ext jpg -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
```
It works also with movies/videos
```bash
exiftool 2*_*.mp4 "-FileName<CreateDate"       -ext mp4 -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
```
### Copy exif dates
helpful for WhatsApp images
```bash
exiftool -overwrite_original  "-CreateDate<FileModifyDate" *
```
## Resize
resizing images using multiple cores
```bash
find . -name "*.jpg" | parallel -j10  --progress --bar mogrify -quality 90%
```
