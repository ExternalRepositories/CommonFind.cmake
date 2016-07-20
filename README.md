Target: CMake >= 2.8.3

## Goal

Provide a generic method to find "common" libraries.

## Usage

Copy the file CommonFind.cmake to your project's root directory.

Add your project's root directory to `CMAKE_MODULE_PATH` and include CommonFind in your CMakeLists.txt:
```
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})
include(CommonFind)
```

Call `common_find_package` function. Its arguments are:

* `NAME` (mandatory, string): name (used to define imported targets, as ${NAME}::${NAME}, for CMake >= 3.0.0)
* `OUTPUT_VARIABLE_NAME` (mandatory, string): prefix for output variables (`${OUTPUT_VARIABLE_NAME}_FOUND`, `${OUTPUT_VARIABLE_NAME}_VERSION`, ...)
* `QUIET` or `REQUIRED`: when `REQUIRED` is set, a fatal error is thrown if the library can't be found
* `PKG_CONFIG_MODULE_NAME` (string): name of the pkg-config component to check (if provided and pkg-config is available)
* `CONFIG_EXECUTABLE` (string): name of an external executable from which informations can be extracted
* `CONFIG_EXECUTABLE_LIBRARY_ARGUMENTS` (string, default: "--libs"): list of arguments to pass to ${CONFIG_EXECUTABLE} to get library path
* `CONFIG_EXECUTABLE_INCLUDE_ARGUMENTS` (string, default: "--includedir"): list of arguments to pass to ${CONFIG_EXECUTABLE} to get include directory
* `LIBRARIES` (mandatory, ;-list of strings): name(s) of the library to find
* `HEADER` (mandatory, string): name of a major header file to find
* `SUFFIXES` (;-list of strings): directory names to pass as `PATH_SUFFIXES` to `find_path` and `find_library`
* `VERSION_HEADER` (string, default: same as `HEADER`): name of header file from which to extract version informations
* `VERSION_REGEXPES` (;-list of strings): one or more regexp to extract version number(s) from header file.
#   - use a single regexp for a dotted version (major.minor.patch) or a numeric version number (eg: 50630)
#   - provide 3 regexpes if major/minor/patch are on seperated lines/macros


See CMakeLists.txt for examples.
