# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.4/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/anatolii/Desktop/Oper_Syst/hometask_3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/anatolii/Desktop/Oper_Syst/hometask_3/build

# Include any dependencies generated for this target.
include CMakeFiles/parent.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/parent.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/parent.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/parent.dir/flags.make

CMakeFiles/parent.dir/parent.cpp.o: CMakeFiles/parent.dir/flags.make
CMakeFiles/parent.dir/parent.cpp.o: /Users/anatolii/Desktop/Oper_Syst/hometask_3/parent.cpp
CMakeFiles/parent.dir/parent.cpp.o: CMakeFiles/parent.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/anatolii/Desktop/Oper_Syst/hometask_3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/parent.dir/parent.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/parent.dir/parent.cpp.o -MF CMakeFiles/parent.dir/parent.cpp.o.d -o CMakeFiles/parent.dir/parent.cpp.o -c /Users/anatolii/Desktop/Oper_Syst/hometask_3/parent.cpp

CMakeFiles/parent.dir/parent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/parent.dir/parent.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/anatolii/Desktop/Oper_Syst/hometask_3/parent.cpp > CMakeFiles/parent.dir/parent.cpp.i

CMakeFiles/parent.dir/parent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/parent.dir/parent.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/anatolii/Desktop/Oper_Syst/hometask_3/parent.cpp -o CMakeFiles/parent.dir/parent.cpp.s

# Object files for target parent
parent_OBJECTS = \
"CMakeFiles/parent.dir/parent.cpp.o"

# External object files for target parent
parent_EXTERNAL_OBJECTS =

parent: CMakeFiles/parent.dir/parent.cpp.o
parent: CMakeFiles/parent.dir/build.make
parent: CMakeFiles/parent.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/anatolii/Desktop/Oper_Syst/hometask_3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable parent"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parent.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/parent.dir/build: parent
.PHONY : CMakeFiles/parent.dir/build

CMakeFiles/parent.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/parent.dir/cmake_clean.cmake
.PHONY : CMakeFiles/parent.dir/clean

CMakeFiles/parent.dir/depend:
	cd /Users/anatolii/Desktop/Oper_Syst/hometask_3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/anatolii/Desktop/Oper_Syst/hometask_3 /Users/anatolii/Desktop/Oper_Syst/hometask_3 /Users/anatolii/Desktop/Oper_Syst/hometask_3/build /Users/anatolii/Desktop/Oper_Syst/hometask_3/build /Users/anatolii/Desktop/Oper_Syst/hometask_3/build/CMakeFiles/parent.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/parent.dir/depend

