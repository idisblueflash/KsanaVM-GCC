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
include CMakeFiles/headers.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/headers.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/headers.dir/flags.make

CMakeFiles/headers.dir/main.c.o: CMakeFiles/headers.dir/flags.make
CMakeFiles/headers.dir/main.c.o: ../main.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/headers.dir/main.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/headers.dir/main.c.o   -c /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/main.c

CMakeFiles/headers.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/headers.dir/main.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/main.c > CMakeFiles/headers.dir/main.c.i

CMakeFiles/headers.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/headers.dir/main.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/main.c -o CMakeFiles/headers.dir/main.c.s

CMakeFiles/headers.dir/main.c.o.requires:
.PHONY : CMakeFiles/headers.dir/main.c.o.requires

CMakeFiles/headers.dir/main.c.o.provides: CMakeFiles/headers.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/headers.dir/build.make CMakeFiles/headers.dir/main.c.o.provides.build
.PHONY : CMakeFiles/headers.dir/main.c.o.provides

CMakeFiles/headers.dir/main.c.o.provides.build: CMakeFiles/headers.dir/main.c.o
.PHONY : CMakeFiles/headers.dir/main.c.o.provides.build

# Object files for target headers
headers_OBJECTS = \
"CMakeFiles/headers.dir/main.c.o"

# External object files for target headers
headers_EXTERNAL_OBJECTS =

libheaders.a: CMakeFiles/headers.dir/main.c.o
libheaders.a: CMakeFiles/headers.dir/build.make
libheaders.a: CMakeFiles/headers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libheaders.a"
	$(CMAKE_COMMAND) -P CMakeFiles/headers.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/headers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/headers.dir/build: libheaders.a
.PHONY : CMakeFiles/headers.dir/build

CMakeFiles/headers.dir/requires: CMakeFiles/headers.dir/main.c.o.requires
.PHONY : CMakeFiles/headers.dir/requires

CMakeFiles/headers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/headers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/headers.dir/clean

CMakeFiles/headers.dir/depend:
	cd /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fox/KsanaVM-GCC/02-lesson01-compiling-test /home/fox/KsanaVM-GCC/02-lesson01-compiling-test /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build /home/fox/KsanaVM-GCC/02-lesson01-compiling-test/build/CMakeFiles/headers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/headers.dir/depend

