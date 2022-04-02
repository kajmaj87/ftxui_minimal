# ftxui_minimal
Minimal FTXUI example with Docker builds for WebAssembly and console.

This is based on https://github.com/ArthurSonzogni/FTXUI library 

This example was prepared to showcase an error with running the minimal example in browser.

## Preparing image

Run:

``$ docker build -t ftxui .``

## Running the example in browser

Run:

``$ docker run -p 8888:8888 ftxui``

After going to browser under http://localhost:8888 a slider should be visible.

## Running the example in console

Run:

``$ docker run -ti ftxui build/ftxui_minimal``

You should see something similar to this in console:

<img src=https://i.imgur.com/vk4NBiX.png />

## Automatic deployment

This code is automatically build and submitted to https://kajmaj87.github.io/ftxui_minimal/
