#!/bin/bash

pkg update
termux-setup-storage
pkg install -y ffmpeg python
pip install youtube-dl

mkdir ~/bin
cd ~/bin
echo "youtube-dl --extract-audio --audio-quality 0 --audio-format mp3 -o \"~/storage/shared/Music/%(playlist_title)s/%(title)s.%(ext)s\" " > termux-url-opener
