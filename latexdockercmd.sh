#!/usr/bin/env sh
IMAGE=latex-g7-32
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/doc "$IMAGE" "$@"
