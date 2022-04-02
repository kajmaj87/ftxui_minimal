FROM gcc:11.2.0

RUN mkdir /example
WORKDIR /example
RUN git clone https://github.com/emscripten-core/emsdk.git
RUN cd emsdk && ./emsdk install latest

RUN apt-get update && apt-get install -y cmake python3

COPY . .
# Build webasm version
RUN emsdk/emsdk activate latest && \
    mkdir build_webasm && \
    cd build_webasm && \
    cmake .. -DCMAKE_TOOLCHAIN_FILE=/example/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake -DPLATFORM=Web && \
    cmake --build .

# Build regular version
RUN mkdir build && \
    cd build && \
    cmake .. && \
    cmake --build .

WORKDIR /example/site

CMD ["python3", "run_webassembly.py"]