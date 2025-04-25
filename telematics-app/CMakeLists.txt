################################################################################
# Root CMakeLists.txt for project-teletrack-sim
# 
# This is the main configuration file for the TeleTrack Simulator project.
# It sets up the project, enables testing, and adds subdirectories.
################################################################################

# Specify minimum required CMake version range
cmake_minimum_required(VERSION 3.16..3.24)

# Define the project with version, description and languages
project(project_teletrack_sim       VERSION 0.0.1
                                    DESCRIPTION "project-teletrack-sim"
                                    LANGUAGES CXX
)


include(CTest)                              # Enable testing using CTest
add_subdirectory(external)                  # Add external dependencies (like googletest)
add_subdirectory(modules/gnss_simulator)   # Add project modules

add_executable(project_teletrack_sim
    src/main.cpp
)


target_include_directories(project_teletrack_sim
PRIVATE 
    modules/gnss_simulator/include
)
target_link_libraries(project_teletrack_sim
  PRIVATE
    gnss_simulator
)