# modules/gnss_simulator/CMakeLists.txt

add_library(gnss_simulator
  src/gnss.cpp
)

target_include_directories(gnss_simulator
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# ——— REGISTER UNIT TESTS ———
# (this only runs if `include(CTest)` was called in your root CMake)
if (BUILD_TESTING)
  add_executable(test_gnss
    tests/test_gnss.cpp
  )
  target_link_libraries(test_gnss
    PRIVATE
      gnss_simulator
      GTest::gtest_main
  )

  include(GoogleTest)
  gtest_discover_tests(test_gnss)
endif()
