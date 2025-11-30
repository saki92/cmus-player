#!/bin/bash

# Start CMUS in the background
screen -dmS cmus cmus

# Wait for CMUS to start up
sleep 2

# Configure audio output for USB device (adjust card number as needed)
cmus-remote -C "set output_plugin=alsa"
cmus-remote -C "set dsp.alsa.device=hw:3,0"

# Add music directory to library if not already added
cmus-remote -C "add /music"

# Optional: Update cache to ensure all files are indexed
cmus-remote -C "update-cache"

# Set play mode options
cmus-remote -C "set repeat=true"      # Repeat all tracks
cmus-remote -C "set shuffle=false"    # Or true if you want shuffle

# Start playing
# Wait a bit for library to be ready
sleep 1

# Start playback from the beginning of library
cmus-remote -C "player-play"

# Alternative: Play a specific file
# cmus-remote -C "player-play /music/your-favorite.mp3"

echo "CMUS started and playing!"
echo "To attach to CMUS, run: screen -r cmus"

# Keep container running
tail -f /dev/null
