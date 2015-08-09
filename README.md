docker build -t sublimetext3 .
docker run -ti --rm --name sublimetext3 -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix sublimetext3
