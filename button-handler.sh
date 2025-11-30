#!/bin/bash
# Handle button events for USB speaker

# Find the audio input device
AUDIO_DEVICE="/dev/input/event0"

# Create triggerhappy config
mkdir -p /etc/triggerhappy/triggers.d/
cat > /etc/triggerhappy/triggers.d/cmus-audio.conf << 'CONFIG'
# Volume controls
KEY_VOLUMEUP    1    /usr/bin/cmus-remote -v +5
KEY_VOLUMEDOWN  1    /usr/bin/cmus-remote -v -5
KEY_MUTE        1    /usr/bin/cmus-remote -v 0

# Media controls (if your speaker has them)
KEY_PLAYPAUSE   1    /usr/bin/cmus-remote -u
KEY_PLAY        1    /usr/bin/cmus-remote -p
KEY_PAUSE       1    /usr/bin/cmus-remote -u
KEY_NEXTSONG    1    /usr/bin/cmus-remote -n
KEY_PREVIOUSSONG 1   /usr/bin/cmus-remote -r
CONFIG

echo "Starting triggerhappy on $AUDIO_DEVICE..."
# Kill any existing thd process
pkill thd 2>/dev/null || true

# Start triggerhappy in foreground (will be backgrounded by docker-compose)
exec thd --triggers /etc/triggerhappy/triggers.d/ --deviceglob $AUDIO_DEVICE
