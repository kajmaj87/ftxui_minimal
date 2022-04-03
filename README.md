# ftxui_minimal
Minimal FTXUI example with Docker builds for WebAssembly and console.

This is based on https://github.com/ArthurSonzogni/FTXUI library 

This example was prepared to showcase an error with running the minimal example in browser.

## Building and running manually

You would have to install emscripten as described in https://emscripten.org/docs/getting_started/downloads.html

Now run the following:

```
$ mkdir build_webasm
$ cd build_webasm
$ cmake .. -DCMAKE_TOOLCHAIN_FILE=/path/to/yours/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake -DPLATFORM=Web -DCMAKE_EXPORT_COMPILE_COMMANDS=ON 
$ cmake --build .
$ cd ../docs
$ python3 run_webassembly.py
```

Page under http://localhost:8888 should automatically open.

## Building and running with Docker

### Preparing image

Run:

``$ docker build -t ftxui .``

### Running the example in browser

Run:

``$ docker run -p 8888:8888 ftxui``

After going to browser under http://localhost:8888 a slider should be visible.

### Running the example in console

Run:

``$ docker run -ti ftxui build/ftxui_minimal``

You should see something similar to this in console:

<img src=https://i.imgur.com/vk4NBiX.png />

## Automatic deployment

This code is automatically build and submitted to https://ftxui-minimal.pages.dev/.

This is done using the configured main.yml workflow, which builds wasm binaries and then pushes them to gh-pages branch. This branch is then picked up by Cloudflare and deployed on mentioned url. To make all of this work \_headers file was needed.
