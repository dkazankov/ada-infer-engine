cmake_minimum_required(VERSION 3.5.0)
project(NNEF-CPP-Tools VERSION 0.1.0 LANGUAGES CXX)

add_subdirectory("NNEF-Tools/nnef-pyproject/nnef/cpp")
add_subdirectory("tools")

file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()
