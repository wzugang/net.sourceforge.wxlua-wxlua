#! /bin/bash
set -e

PRJ_DIR=${PWD}

# Set the build folder. All generated content will be below this path.
BUILD_DIR="${PRJ_DIR}/build/windows64"

# All CMAKE arguments defining the target system and the compiler for it.
CMAKE_COMPILER="-DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_RC_COMPILER=x86_64-w64-mingw32-windres"

# This is the absolute path to the jonchki tool.
JONCHKI=${PRJ_DIR}/jonchki/local/jonchki.lua
# All jonchki arguments to select the target system.
JONCHKI_SYSTEM="--distribution-id windows --cpu-architecture x86_64"

# Build the project.
. "${PRJ_DIR}/.build_common.sh"
