cmake_minimum_required(VERSION 3.13)

include(${PICO_SDK}/pico_sdk_init.cmake)

project(my_project)

pico_sdk_init()

add_executable(hello
  hello.c
  )

# EOF #

