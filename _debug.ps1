# This is a reference script I use for my templates to be able to build the site using
# Docker for Windows

docker run -d -p 8043:8043 -v "${PWD}/_site:/srv/http" --name goStatic pierrezemb/gostatic
docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/builder jekyll build --watch
docker rm -f goStatic