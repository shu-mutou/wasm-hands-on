WebAssembly hans-on
===================

Write wasm app in rust or go and run it with wasmtime.
Then deploy app into k8s cluster via Krustlet.
Or deploy app in wasmtime pod.

---

## Write sample app for only calcuration

* not server, no networking
* no accessing filesystem
* ref: https://github.com/golang/go/wiki/WebAssembly#getting-started
* `cd sample-app`
* Run `GOOS=linux GOARCH=amd64 ./go-build.sh`
* Run `./app` to confirm output of this `sample-app`.
* Run `./go-build.sh` for WebAssembly

## Write simple REST API fow [WAGI](https://github.com/deislabs/wagi)

* networking!

* Add outputs for `status: 200`, `content-type: text/plain` and blank output lines for HTTP. See, `./sample-wagi`.
* Build it with `./tinygo-build.sh`.
* Copy `./sample-wagi/app` to `./wagi/app.wasm`.
* Edit `./sample-wagi/modules.toml`
* Build container image for `wagi`, running `docker build -f Dockerfile-wagi`
* Then, run `docker run -it -v $(pwd)/wagi:/workspace -p 33000:3000 --name wagi wagi wagi -c modules.toml -l 0.0.0.0:3000`
* Access `http://localhost:33000/` from browser.

## Run wasm with wasmtime

* Use `wasmtime` that is runtime used in Krustlet.

### Deploy wasm into kubernetes
#### Create k8s cluster with kind
#### Create Krustlet node with docker
#### Create wasmtime container for pod

## Run wasm with wasmer

### Deploy wasm into kubernetes
#### Create k8s cluster with kind
#### Create wasmer container for pod

