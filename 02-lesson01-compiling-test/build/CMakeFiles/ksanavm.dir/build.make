# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fox/KsanaVM-GCC/02-lesson01-compiling-test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build

# Include any dependencies generated for this target.
include CMakeFiles/ksanavm.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ksanavm.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ksanavm.dir/flags.make

CMakeFiles/ksanavm.dir/main.c.o: CMakeFiles/ksanavm.dir/flags.make
CMakeFiles/ksanavm.dir/main.c.o: ../main.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/ksanavm.dir/main.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/ksanavm.dir/main.c.o   -c /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/main.c

CMakeFiles/ksanavm.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ksanavm.dir/main.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/main.c > CMakeFiles/ksanavm.dir/main.c.i

CMakeFiles/ksanavm.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ksanavm.dir/main.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/main.c -o CMakeFiles/ksanavm.dir/main.c.s

CMakeFiles/ksanavm.dir/main.c.o.requires:
.PHONY : CMakeFiles/ksanavm.dir/main.c.o.requires

CMakeFiles/ksanavm.dir/main.c.o.provides: CMakeFiles/ksanavm.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/ksanavm.dir/build.make CMakeFiles/ksanavm.dir/main.c.o.provides.build
.PHONY : CMakeFiles/ksanavm.dir/main.c.o.provides

CMakeFiles/ksanavm.dir/main.c.o.provides.build: CMakeFiles/ksanavm.dir/main.c.o
.PHONY : CMakeFiles/ksanavm.dir/main.c.o.provides.build

# Object files for target ksanavm
ksanavm_OBJECTS = \
"CMakeFiles/ksanavm.dir/main.c.o"

# External object files for target ksanavm
ksanavm_EXTERNAL_OBJECTS =

ksanavm: CMakeFiles/ksanavm.dir/main.c.o
ksanavm: libheaders.a
ksanavm: CMakeFiles/ksanavm.dir/build.make
ksanavm: CMakeFiles/ksanavm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ksanavm"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ksanavm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ksanavm.dir/build: ksanavm
.PHONY : CMakeFiles/ksanavm.dir/build

CMakeFiles/ksanavm.dir/requires: CMakeFiles/ksanavm.dir/main.c.o.requires
.PHONY : CMakeFiles/ksanavm.dir/requires

CMakeFiles/ksanavm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ksanavm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ksanavm.dir/clean

CMakeFiles/ksanavm.dir/depend:
	cd /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fox/KsanaVM-GCC/02-lesson01-compiling-test /home/fox/KsanaVM-GCC/02-lesson01-compiling-test /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build/CMakeFiles/ksanavm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ksanavm.dir/depend

