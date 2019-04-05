#! /bin/bash

##############################
## LUPI STREAM
##
## Streaming on RPI via ffmpeg
##

STREAM_KEY="your stream key"
STREAM_URL="rtmp://live.twitch.tv/app/$STREAM_KEY"

FPS="30"
RES="1280x720"

SOURCE="/dev/video0"
QUAL="libvpx-720p50_60"


#ffmpeg -f x11grab -s "$SOURCE" -r "$FPS" -i :0.0 -vcodec libx264 -s "$RES" -vpre "$QUAL" -acodec libmp3lame -threads 6 -qscale 5 -b 64KB -f flv -ar 44100 "$STREAM_URL"

ffmpeg -i "udp://:10.5.5.9:8554" -fflags nobuffer -f:v mpegts -probesize 8192 -f flv "$STREAM_URL"



