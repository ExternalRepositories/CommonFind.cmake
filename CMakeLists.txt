cmake_minimum_required(VERSION 2.8.3)

set(CMAKE_FIND_DEBUG_MODE TRUE)
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})

function(println)
    message("==============================")
endfunction(println)

function(debug PREFIX)
    set(SUFFIXES "FOUND" "VERSION" "VERSION_MAJOR" "VERSION_MINOR" "VERSION_PATCH" "LIBRARY" "LIBRARIES" "INCLUDE_DIR" "INCLUDE_DIRS")
#     list(APPEND SUFFIXES "FIND_VERSION" "FIND_VERSION_EXACT" "FIND_COMPONENTS" "FIND_REQUIRED" "FIND_QUIETLY")
    if(MSVC)
        list(APPEND SUFFIXES "LIBRARY_RELEASE" "LIBRARY_DEBUG")
    endif(MSVC)
    foreach(SUFFIX ${SUFFIXES})
        if(DEFINED ${PREFIX}_${SUFFIX})
            message("${PREFIX}_${SUFFIX} = ${${PREFIX}_${SUFFIX}}")
        else(DEFINED ${PREFIX}_${SUFFIX})
            message("${PREFIX}_${SUFFIX} = <UNDEFINED>")
        endif(DEFINED ${PREFIX}_${SUFFIX})
    endforeach(SUFFIX)
    println()
endfunction(debug)

include(CommonFind)

find_package(XXX QUIET)
debug("XXX")

find_package(MySQL 5.5 REQUIRED)
debug("MySQL")

find_package(PCRE QUIET)
debug("PCRE")

find_package(Editline QUIET)
debug("Editline")

find_package(SQLite3 QUIET)
debug("SQLite3")

get_cmake_property(PACKAGES_FOUND PACKAGES_FOUND)
message("PACKAGES_FOUND = ${PACKAGES_FOUND}")
get_cmake_property(PACKAGES_NOT_FOUND PACKAGES_NOT_FOUND)
message("PACKAGES_NOT_FOUND = ${PACKAGES_NOT_FOUND}")
