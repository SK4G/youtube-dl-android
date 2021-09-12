#!/bin/bash

pkg update
termux-setup-storage
pkg install -y ffmpeg python atomicparsley
pip install youtube-dl

mkdir ~/bin
cd ~/bin

#echo "youtube-dl --extract-audio --audio-quality 0 --audio-format mp3 -o \"~/storage/shared/Music/%(playlist_title)s/%(title)s.%(ext)s\" " > termux-url-opener
# echo "youtube-dl -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata --metadata-from-title \"%(artist)s - %(title)s\" -o \"~/storage/shared/Music/%(playlist_title)s/%(title)s.%(ext)s\" $1" > termux-url-opener
