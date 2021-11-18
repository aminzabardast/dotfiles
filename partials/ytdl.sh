#!/bin/sh

source "$PWD/utils.sh"

cecho "RED" "Installing yt-dlp ..."
sudo pacman --noconfirm --needed -S yt-dlp

echo "
# yt-dlp Stuff
alias vdl='yt-dlp --write-sub -o \"%(title)s.%(id)s.%(ext)s\"'
alias vdl-best='yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4\" --write-sub -o \"%(title)s.%(id)s.%(ext)s\"'
alias vdl-list='yt-dlp --write-sub -o \"%(playlist_index)s.%(title)s.%(id)s.%(ext)s\"'
alias vdl-list-best='yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4\" --write-sub -o \"%(playlist_index)s.%(title)s.%(id)s.%(ext)s\"'
alias adl='yt-dlp -x --audio-format mp3 -o \"%(title)s.%(id)s.%(ext)s\"'
alias vdl-id-p='yt-dlp --proxy \"socks5://127.0.0.1:9150\" -o \"~/Videos/%(id)s.%(ext)s\" '  # tor port is 9150
" >> "$HOME/.personal"