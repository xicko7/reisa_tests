# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

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
CMAKE_COMMAND = /gpfs/users/fernandezx/spack/opt/spack/linux-centos7-cascadelake/gcc-11.2.0/cmake-3.24.3-ozmdie7tj76e7ljinj2mbyxgkev4xmr2/bin/cmake

# The command to remove a file.
RM = /gpfs/users/fernandezx/spack/opt/spack/linux-centos7-cascadelake/gcc-11.2.0/cmake-3.24.3-ozmdie7tj76e7ljinj2mbyxgkev4xmr2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04

# Include any dependencies generated for this target.
include CMakeFiles/simulation.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/simulation.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/simulation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/simulation.dir/flags.make

CMakeFiles/simulation.dir/simulation.c.o: CMakeFiles/simulation.dir/flags.make
CMakeFiles/simulation.dir/simulation.c.o: simulation.c
CMakeFiles/simulation.dir/simulation.c.o: CMakeFiles/simulation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/simulation.dir/simulation.c.o"
	/gpfs/softs/spack/opt/spack/linux-centos7-haswell/gcc-4.8.5/gcc-11.2.0-mpv3i3uebzvnvz7wxn6ywysd5hftycj3/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/simulation.dir/simulation.c.o -MF CMakeFiles/simulation.dir/simulation.c.o.d -o CMakeFiles/simulation.dir/simulation.c.o -c /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04/simulation.c

CMakeFiles/simulation.dir/simulation.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simulation.dir/simulation.c.i"
	/gpfs/softs/spack/opt/spack/linux-centos7-haswell/gcc-4.8.5/gcc-11.2.0-mpv3i3uebzvnvz7wxn6ywysd5hftycj3/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04/simulation.c > CMakeFiles/simulation.dir/simulation.c.i

CMakeFiles/simulation.dir/simulation.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simulation.dir/simulation.c.s"
	/gpfs/softs/spack/opt/spack/linux-centos7-haswell/gcc-4.8.5/gcc-11.2.0-mpv3i3uebzvnvz7wxn6ywysd5hftycj3/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04/simulation.c -o CMakeFiles/simulation.dir/simulation.c.s

# Object files for target simulation
simulation_OBJECTS = \
"CMakeFiles/simulation.dir/simulation.c.o"

# External object files for target simulation
simulation_EXTERNAL_OBJECTS =

simulation: CMakeFiles/simulation.dir/simulation.c.o
simulation: CMakeFiles/simulation.dir/build.make
simulation: /gpfs/softs/spack_0.17/opt/spack/linux-centos7-cascadelake/gcc-11.2.0/openmpi-4.1.1-ujlwnrlh5sewm2rxkpio3h5mariwgetn/lib/libmpi.so
simulation: /gpfs/users/fernandezx/spack/opt/spack/linux-centos7-cascadelake/gcc-11.2.0/pdi-1.6.0-thb2ca5n6zmi6ufxifzbwneip5f2oe2l/lib64/libpdi.so.1.6.0
simulation: /gpfs/users/fernandezx/spack/opt/spack/linux-centos7-cascadelake/gcc-11.2.0/paraconf-1.0.0-i4ggpfs3wrmzse6r7xwfpeentcb3u7v5/lib64/libparaconf.so.1.0.0
simulation: /gpfs/users/fernandezx/spack/opt/spack/linux-centos7-cascadelake/gcc-11.2.0/libyaml-0.2.5-zso2vr22p5663wq3dx57hzibo766tjeu/lib/libyaml.so
simulation: CMakeFiles/simulation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable simulation"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simulation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/simulation.dir/build: simulation
.PHONY : CMakeFiles/simulation.dir/build

CMakeFiles/simulation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/simulation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/simulation.dir/clean

CMakeFiles/simulation.dir/depend:
	cd /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04 /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04 /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04 /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04 /gpfs/users/fernandezx/internship/reisa_tests/REISA/reduction/P128-SN4-LS134-GS17179-I25-AN2-D2023-06-14_14:27:04/CMakeFiles/simulation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/simulation.dir/depend
