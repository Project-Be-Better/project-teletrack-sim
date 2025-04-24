################################################################################
# External dependencies configuration
# 
# This file manages third-party libraries and dependencies used by the project.
# It sets C++ standard and includes external libraries like googletest.
################################################################################

# Set C++ language standard for all targets in this directory and below
set(CMAKE_CXX_STANDARD 17)

# Add googletest library (for unit testing)
add_subdirectory(googletest)