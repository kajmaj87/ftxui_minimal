cmake_minimum_required(VERSION 3.18)

# create project
project(ftxui_minimal 
    VERSION 0.1 
    DESCRIPTION "Simplest ftxui example to show webasm bug"
    LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
if (EMSCRIPTEN) 
    #string(APPEND CMAKE_CXX_FLAGS " -s ASSERTIONS=1") 
    string(APPEND CMAKE_CXX_FLAGS " -s USE_PTHREADS") 
    string(APPEND CMAKE_EXE_LINKER_FLAGS " -s ASYNCIFY") 
    string(APPEND CMAKE_EXE_LINKER_FLAGS " -s PROXY_TO_PTHREAD") 
endif() 

# add executable
add_executable(${PROJECT_NAME} main.cpp)
target_compile_options(${PROJECT_NAME} PRIVATE)

# add dependencies
include(cmake/CPM.cmake)
CPMAddPackage("gh:ArthurSonzogni/FTXUI@2.0.0")

# link dependencies
target_link_libraries(${PROJECT_NAME} 
    PRIVATE ftxui::screen
    PRIVATE ftxui::dom
    PRIVATE ftxui::component)

if (EMSCRIPTEN) 
    add_custom_command(TARGET ${PROJECT_NAME} 
                    POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E make_directory ../docs/generated)
    add_custom_command(TARGET ${PROJECT_NAME} 
                    POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E copy ftxui_minimal.js ../docs/generated/ftxui_minimal.js)
    add_custom_command(TARGET ${PROJECT_NAME} 
                    POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E copy ftxui_minimal.wasm ../docs/generated/ftxui_minimal.wasm)
    add_custom_command(TARGET ${PROJECT_NAME} 
                    POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E copy ftxui_minimal.worker.js ../docs/generated/ftxui_minimal.worker.js)
endif() 