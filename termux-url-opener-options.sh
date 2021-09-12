#!/data/data/com.termux/files/usr/bin/zsh
#
# This is a termux-url-opener script to do diffrent tasks on my Android phone 
#
#
#
# How to use this script
#############################
# Create the bin directory
# ➜ ~ mkdir bin
# ➜ ~ cd bin
# Create the script (copy & paste) I use neovim. Use your prefered editor
# ➜ nvim termux-url-opener
# 
# Make it executable
# ➜ chmod +x termux-url-opener
# 
# Install zsh wget and ffmpeg
# ➜ pkg install zsh wget ffmpeg python
# https://wiki.termux.com/wiki/Shells
#
# Install youtube_dl and scdl with pip
# ➜ pip install youtube_dl
# ➜ pip install scdl mutagen
#
# run the following command to enable the termux storage features
# ➜ termux-setup-storage
# https://wiki.termux.com/wiki/Termux-setup-storage

url=$1
echo "What should I do with $url ?"
echo "1) download audio with spotdl to Music folder"
echo "2) download audio with youtube-dl to Music folder"
echo "3) download video with youtube-dl to Movies"
echo "w) wget file to Download folder" 
echo "x) nothing"

read CHOICE
case $CHOICE in
    3)
        youtube-dl -o "/storage/emulated/0/Movies/%(title)s.%(ext)s" $url
	;;
    2)
	echo "Artist"
	read artist
	echo "Title"
	read title
	echo "Album"
	read album
	youtube-dl --extract-audio --audio-format mp3 --output "/storage/emulated/0/Music/$artist-$title.%(ext)s" $url
	mid3v2 -a $artist -t $title -A $album /storage/emulated/0/Music/$artist-$title.mp3

    # youtube-dl -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata --metadata-from-title "%(artist)s - %(title)s" -o "~/storage/shared/Music/%(playlist_title)s/%(title)s.%(ext)s" $1
	;;
    1)
    SONGS="$HOME/storage/shared/Music"
    SPOTDL="/data/data/com.termux/files/usr/bin/spotdl"

    if [[ $1 == *"open.spotify.com"* ]]; then
        if [[ ! -d $SONGS ]]; then
            mkdir $SONGS
        fi

        cd $SONGS
        $SPOTDL "$1" --output-format m4a

        read -n 1 -s -p "Press Any Key To Exit."
    fi

	;;
    w)
        cd ~/storage/downloads
	wget $url
	;;
    x)
        echo "bye"
	;; 
esac