#!/usr/bin/bash

FILES="$1/*"

mkdir docs images media codes unspecified

for f in $FILES;
do
  case "$f" in
    *.txt | *.docx | *.pdf | *.md)
      mv $f docs
      ;;

    *.png | *.jpg | *.jpeg | *.svg)
      mv $f images
      ;;

    *.mp4 | *.mp3 | *.gif | *.mov | *.wmv | *.avi | *.webm | *.mkv)
      mv $f media
      ;;

    *.c | *.cpp | *.py | *.go | *.rs | *.html | *.js | *.css | *.ts)
      mv $f codes
      ;;
  esac
done




