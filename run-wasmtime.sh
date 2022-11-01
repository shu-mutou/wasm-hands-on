#!/bin/bash

# specify source directory in fullpath.
SRC_DIR=${SRC_DIR:-$1}
SRC_DIR=${SRC_DIR:-$(pwd)}

docker build -t wasmtime .

docker run -it --rm \
  -e HTTP_PROXY=${HTTP_PROXY} \
  -e HTTPS_PROXY=${HTTPS_PROXY} \
  -v ${SRC_DIR}:/usr/local/bin \
  --name wasmtime \
  wasmtime \
  bash
