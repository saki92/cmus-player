## About
A docker based MP3 player targeted for SBC with a USB speaker attached.

## Usage
- Build the image with `docker build -f Dockerfile -t cmus-ubuntu:final .`
- Create a directory `music` in the same path as docker-compose.yml and place all the MP3 tracks
- Start the container with `docker compose up -d`

## Features
If the USB speaker features volume buttons then it can be used to pass volume commands to cmus player. This is done with `triggerhappy`. Make sure to find the right event input and change in the docker file. The right USB input can be identified using `evtest`.

## Useful Commands
Play: `docker compose exec cmus cmus-remote -p`

Pause: `docker compose exec cmus cmus-remote -u`

Next track: `docker compose exec cmus cmus-remote -n`

Previous track / repeat: `docker compose exec cmus cmus-remote -r`

Stop: `docker compose exec cmus cmus-remote -s`

Volume control:
```
docker compose exec cmus cmus-remote -v +10  # Volume up 10%
docker compose exec cmus cmus-remote -v -10  # Volume down 10%
docker compose exec cmus cmus-remote -v 50   # Set to 50%
```

To change volume via alsamixer: `docker compose exec cmus alsamixer`
