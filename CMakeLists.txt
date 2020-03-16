cmake_minimum_required(VERSION 3.7)

project(mars VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )

################################### ARES ###################################
include_directories(../ares/include/)
file(GLOB ARES_SOURCES
    "../ares/src/formula/*.cpp"
        "../ares/src/formula/extended/*.cpp"
        "../ares/src/util/*.cpp"
        "../ares/src/rule/*.cpp"
        "../ares/src/rule/filter/*.cpp"
        "../ares/src/rule/math/*.cpp"
        "../ares/src/rule/math/evaluator/*.cpp"
        "../ares/src/core/*.cpp"
        "../ares/src/example/*.cpp"
        "../ares/src/service/*.cpp"
        )

find_package(Threads)

################################## SIMPLEAPP ##################################
include_directories(include/)
file(GLOB MARS_SOURCES
        "src/*.cpp"
    )

set(MARS_ARES_SOURCES ${ARES_SOURCES} ${MARS_SOURCES})
add_executable(mars main.cpp ${MARS_ARES_SOURCES})
target_link_libraries(mars ${CMAKE_THREAD_LIBS_INIT})

