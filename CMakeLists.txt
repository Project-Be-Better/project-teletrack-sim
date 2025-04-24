cmake_minimum_required(VERSION 3.16..3.24)

project(project-teletrack-sim       VERSION 0.0.1
                                    DESCRIPTION "project-teletrack-sim"
                                    LANGUAGES CXX

)

include(CTest)

add_subdirectory(external)
add_subdirectory(modules/gnss_simulator)