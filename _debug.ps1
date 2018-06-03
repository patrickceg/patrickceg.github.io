# This is a reference script I use for my templates to be able to build the site using
# Docker for Windows

docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/builder jekyll build