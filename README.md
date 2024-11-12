# Introduction 
Ada 95 inference engine.
It implements NNEF 1.0.5 specifications but completely in Ada. Some functions renamed because of matching with Ada reserved words.
The library is made for Ravenscar profile in mind.
So most simple (base) operators do not allocate any memory (excluding some temporary stack variables),
though some compound operators involve large temporary stack allocations.
Functions are practically not used, only procedures with out parameters.

# Getting Started
tests/alexnet.adb contains sample implementation for AlexNet2. It uses Net data converted to NNEF format.
Slightly modified GID library (https://github.com/dkazankov/gid_95_ravenscar) used for image reading.

# Build and Test
To build library:
gprbuild -XBUILD=Debug -P libaie95.gpr

To build tests:
gprbuild -XBUILD=Debug -P tests/tests.gpr

Visual Studio Code scripts are also provided.

All development/testing is done in VSCode for Windows remoted to WSL Ubuntu with GCC 11-14.
NNEF CPP tools debugging was made with Visual Studio Build Tools for Windows, because Linux (and MinGW) GDB hangs on C++11 templates.

# TODO:
Parallel/multi CPU computations.
Vector instructions optimized versions.
CUDA / GPU computations.
GAN implementation.
Converting/reading from Tensorflow, Pytorch, ONNX formats