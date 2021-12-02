# exif_image_cheatsheet


## modify images based on exif data
View exit tags
```bash
exiftool -s -G image.jpg
```
### Rename based on exif date 
Examples:
```bash
rename 'y/A-Z/a-z/' *     # to lower case
rename 's/.jpeg/.jpg/' *  # jpeg to jpg
exiftool *_*.jpg '-FileName<CreateDate'        -ext jpg -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
```
It works also with movies/videos
```bash
exiftool *_*.mp4 "-FileName<CreateDate"       -ext mp4 -d "%Y-%m-%d--%H-%M-%S-%%-.c-markus.%%e"
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
