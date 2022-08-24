cmake_minimum_required(VERSION 3.13)

include(${PICO_SDK_PATH}/pico_sdk_init.cmake)

project(blink)

pico_sdk_init()

add_executable(${PROJECT_NAME} ${PROJECT_NAME}.cpp)
target_link_libraries(${PROJECT_NAME} pico_stdlib)
pico_add_extra_outputs(${PROJECT_NAME})

set(EXTRA_OUTPUTS
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.elf
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.bin
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.hex
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.dis
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.uf2)

install(FILES ${EXTRA_OUTPUTS}
  DESTINATION "${CMAKE_INSTALL_BINDIR}")

# EOF #

