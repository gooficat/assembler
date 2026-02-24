cmake_minimum_required(VERSION 3.10)
project(Assembler)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")

add_executable(Assembler ${SOURCES})
