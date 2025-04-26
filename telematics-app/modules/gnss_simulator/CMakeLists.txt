################################################################################
# modules/gnss_simulator/CMakeLists.txt
#
# GNSS Simulator Module Configuration:
#  - Builds the gnss_simulator library
#  - Configures and discovers unit tests (via GoogleTest)
################################################################################

# 1) Build the library
add_library(gnss_simulator
  src/gnss.cpp
)

target_include_directories(gnss_simulator
  PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# 2) Unit Tests (only if BUILD_TESTING is ON, which CTest enables)
if (BUILD_TESTING)
  # Ensure we can find Conan-provided GTest
  find_package(GTest CONFIG REQUIRED)

  # Create the test executable
  add_executable(test_gnss
    tests/test_gnss.cpp
  )
  
  # Link against the simulator lib and GTest’s main
  target_link_libraries(test_gnss
    PRIVATE
      gnss_simulator
      GTest::gtest_main
  )

  # Discover and register the tests with CTest
  include(GoogleTest)
  gtest_discover_tests(test_gnss
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    PROPERTIES LABELS "unit;gnss"
  )
endif()
