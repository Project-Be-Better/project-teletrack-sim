# modules/gnss_simulator/CMakeLists.txt

################################################################################
# GNSS Simulator Module Configuration
#
# This CMakeLists.txt configures the GNSS simulator module, including:
# - Library target configuration
# - Include directories 
# - Unit tests setup and registration
################################################################################

# Create GNSS simulator library from source files
add_library(gnss_simulator
  src/gnss.cpp
)

# Configure include directories for the library
# PUBLIC makes these include directories available to targets that link against gnss_simulator
target_include_directories(gnss_simulator
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

################################################################################
# Unit Tests Configuration
################################################################################
# Tests are only built if CTest was included in the root CMakeLists.txt
if (BUILD_TESTING)
  # Create test executable
  add_executable(test_gnss
    tests/test_gnss.cpp
  )
  
  # Link test executable with the library being tested and the GoogleTest framework
  target_link_libraries(test_gnss
    PRIVATE
      gnss_simulator   # Link to our simulator library
      GTest::gtest_main # Link to GoogleTest with main() function included
  )

  # Register tests with CTest for automatic test discovery
  include(GoogleTest)
  gtest_discover_tests(test_gnss)
endif()
