cmake_minimum_required(VERSION 3.10)

# set the project name
project(echo_client)

include(FindEXPAT)
find_package(EXPAT REQUIRED)
message(STATUS "expat include-->" ${EXPAT_INCLUDE_DIRS})
message(STATUS "expat libs----->" ${EXPAT_LIBRARIES})

#set(OPENSSL_USE_STATIC_LIBS TRUE)
include(FindOpenSSL)
find_package(OpenSSL)
message(STATUS "open_ssl_include-->" ${OPENSSL_INCLUDE_DIR})
message(STATUS "open_ssl_libs----->" ${OPENSSL_LIBRARIES})

# set(OPENSSL_ROOT_DIR /lib)
# message(STATUS "open_ssl_root-->" ${OPENSSL_ROOT_DIR})

# Set the output folder where your program will be created
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(PROJECT_LINK_LIBS libstrophe.a )
link_directories(/usr/local/lib_JPS)

include_directories("${PROJECT_SOURCE_DIR}"
  /usr/local/include_JPS
  ${EXPAT_INCLUDE_DIRS}
  ${OPENSSL_INCLUDE_DIR})

# add the executable
add_executable(bot src/bot.c)
target_link_libraries(bot ${PROJECT_LINK_LIBS}
  ${EXPAT_LIBRARIES}
  ${OPENSSL_LIBRARIES}
  )

# install targets
install(TARGETS bot DESTINATION ${CMAKE_BINARY_DIR})
