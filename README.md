Target: CMake >= 2.8.3

## Goal

Provide a generic method to find "common" libraries.

* don't repeat yourself (between modules)
* thanks to function/variable scope, limit conflicts on and exposition of "temporary" variables
* share a same logic to be consistent and coherent instead of restarting from scratch for each find module

## Usage

Copy the file CommonFind.cmake to your project's root directory.

Add your project's root directory to `CMAKE_MODULE_PATH` and include CommonFind in your CMakeLists.txt:

```cmake
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})

find_package(xxx #[[ your other arguments ]])

# Example
if(xxx_FOUND)
    add_executable(myapp myapp.c)
    include_directories(${xxx_INCLUDE_DIRS})
    target_link_libraries(myapp ${xxx_LIBRARIES})
    # with CMake >= 3.0.0, the last two lines can be replaced by the following
    target_link_libraries(myapp xxx::xxx)
endif(xxx_FOUND)
```

(replace xxx by the name of your module/library - name is case sensitive)

Create a Findxxx.cmake starting by:

```cmake
cmake_minimum_required(VERSION 2.8.3)

include(CommonFind)
```

Then call to `common_find_package` function. Its arguments are:

* `NAME` (mandatory, string): name (used to define imported targets, as ${NAME}::${NAME}, for CMake >= 3.0.0)
* `OUTPUT_VARIABLE_NAME` (mandatory, string): prefix for output variables (`${OUTPUT_VARIABLE_NAME}_FOUND`, `${OUTPUT_VARIABLE_NAME}_VERSION`, ...)
* `PKG_CONFIG_MODULE_NAME` (string): name of the pkg-config component to check (if provided and pkg-config is available)
* `CONFIG_EXECUTABLE` (string): name of an external executable from which informations can be extracted
* `CONFIG_EXECUTABLE_LIBRARY_ARGUMENTS` (string, default: "--libs"): list of arguments to pass to ${CONFIG_EXECUTABLE} to get library path
* `CONFIG_EXECUTABLE_INCLUDE_ARGUMENTS` (string, default: "--includedir"): list of arguments to pass to ${CONFIG_EXECUTABLE} to get include directory
* `LIBRARIES` (mandatory, ;-list of strings): name(s) of the library to find
* `HEADER` (mandatory, string): name of a major header file to find
* `SUFFIXES` (;-list of strings): directory names to pass as `PATH_SUFFIXES` to `find_path` and `find_library`
* `VERSION_HEADER` (string, default: same as `HEADER`): name of header file from which to extract version informations
* `VERSION_REGEXPES` (;-list of strings): one or more regexp to extract version number(s) from header file.
    + use a single regexp for a dotted version (major.minor.patch) or a numeric version number (eg: 50630)
    + provide 3 regexpes if major/minor/patch are on seperated lines/macros


See Find*.cmake files for examples.
