#!/usr/bin/env bash
set -e

# Display help message
show_help() {
  cat <<EOF
Usage: ./build.sh [options]

Script to build the TeleTrack Simulator project

Options:
  -h, --help        Display this help message
  -c, --clean       Clean build directory before building
  -t, --test        Run tests after building
  -d, --debug       Build in debug mode (default is Release)
  -r, --run         Run the teletrack_app after a successful build
EOF
}

# Default options
BUILD_TYPE="Release"
RUN_TESTS=false
CLEAN_BUILD=false
RUN_APP=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)   show_help; exit 0 ;;
    -c|--clean)  CLEAN_BUILD=true; shift ;;
    -t|--test)   RUN_TESTS=true;  shift ;;
    -d|--debug)  BUILD_TYPE="Debug"; shift ;;
    -r|--run)    RUN_APP=true;    shift ;;
    *) echo "Unknown option: $1"; show_help; exit 1 ;;
  esac
done

BUILD_DIR="build"

# Clean if requested
if [ "$CLEAN_BUILD" = true ]; then
  echo "Cleaning build directory..."
  rm -rf "$BUILD_DIR"
fi

# Create build dir
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Configure
echo "Configuring project with CMake (Build type: $BUILD_TYPE)..."
cmake -DCMAKE_BUILD_TYPE="$BUILD_TYPE" ..

# Build
echo "Building project..."
cmake --build . --config "$BUILD_TYPE"

# Test
if [ "$RUN_TESTS" = true ]; then
  echo "Running tests..."
  ctest -C "$BUILD_TYPE" --output-on-failure
fi

echo "Build completed successfully!"

# Run
if [ "$RUN_APP" = true ]; then
  echo "Launching teletrack_app..."
  ./project_teletrack_sim
fi
