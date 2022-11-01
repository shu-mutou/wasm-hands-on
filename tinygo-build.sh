#!/bin/bash

# specify source directory in fullpath.
SRC_DIR=${SRC_DIR:-$1}
SRC_DIR=${SRC_DIR:-$(pwd)}

docker run --rm \
  -e HTTP_PROXY=${HTTP_PROXY} \
  -e HTTPS_PROXY=${HTTPS_PROXY} \
  -e CGO_ENABLED=0 \
  -e GOOS=${GOOS:-js} \
  -e GOARCH=${GOARCH:-wasm} \
  -v ${SRC_DIR}:/go/src/app \
  -w /go/src/app \
  --name tinygo-builder \
  tinygo/tinygo \
  tinygo build -target wasi -o ${OUTFILE:-app}
