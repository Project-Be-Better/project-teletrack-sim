################################################################################
# Root CMakeLists.txt for project-teletrack-sim
# 
# This is the main configuration file for the TeleTrack Simulator project.
# It sets up the project, enables testing, and adds subdirectories.
################################################################################

# Specify minimum required CMake version range
cmake_minimum_required(VERSION 3.16..3.24)

# Define the project with version, description and languages
project(project-teletrack-sim       VERSION 0.0.1
                                    DESCRIPTION "project-teletrack-sim"
                                    LANGUAGES CXX
)

# Enable testing using CTest
include(CTest)

# Add external dependencies (like googletest)
add_subdirectory(external)

# Add project modules
add_subdirectory(modules/gnss_simulator)