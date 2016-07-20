cmake_minimum_required(VERSION 2.8.3)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})

function(debug PREFIX)
    set(SUFFIXES "FOUND" "VERSION" "VERSION_MAJOR" "VERSION_MINOR" "VERSION_PATCH" "LIBRARY" "LIBRARIES" "INCLUDE_DIR" "INCLUDE_DIRS")
    if(MSVC)
        list(APPEND SUFFIXES "LIBRARY_RELEASE LIBRARY_DEBUG")
    endif(MSVC)
    foreach(SUFFIX ${SUFFIXES})
        if(DEFINED ${PREFIX}_${SUFFIX})
            message("${PREFIX}_${SUFFIX} = ${${PREFIX}_${SUFFIX}}")
        else(DEFINED ${PREFIX}_${SUFFIX})
            message("${PREFIX}_${SUFFIX} = <UNDEFINED>")
        endif(DEFINED ${PREFIX}_${SUFFIX})
    endforeach(SUFFIX)
endfunction(debug)

include(CommonFind)

common_find_package(
    REQUIRED
    NAME PCRE
    LIBRARIES pcre
    HEADER pcre.h
    OUTPUT_VARIABLE_NAME "PCRE"
    PKG_CONFIG_MODULE_NAME libpcre
#     CONFIG_EXECUTABLE pcre-config
    VERSION_REGEXPES "# *define +PCRE_MAJOR +([0-9]+)" "# *define +PCRE_MINOR +([0-9]+)"
)
debug("PCRE")

common_find_package(
    QUIET
    NAME XXX
    LIBRARIES xxx
    HEADER xxx.h
    OUTPUT_VARIABLE_NAME "XXX"
)
debug("XXX")

common_find_package(
    REQUIRED
    NAME MySQL
    SUFFIXES mysql
    LIBRARIES mysqlclient # needs PATH_SUFFIXES mysql?
    HEADER mysql_version.h
    OUTPUT_VARIABLE_NAME "MYSQL"
    PKG_CONFIG_MODULE_NAME mysqlclient
    CONFIG_EXECUTABLE mysql_config
        CONFIG_EXECUTABLE_LIBRARIES_ARGUMENTS "--variable=pkglibdir"
        CONFIG_EXECUTABLE_INCLUDE_ARGUMENTS "--variable=pkgincludedir"
    VERSION_REGEXPES "#[ \t]*define[ \t]+MYSQL_VERSION_ID[ \t]+([0-9]+)"
)
debug("MYSQL")

common_find_package(
    REQUIRED
    NAME Edit
    LIBRARIES edit
    HEADER histedit.h
    OUTPUT_VARIABLE_NAME "EDITLINE"
#     VERSION_REGEXPES "# *define +LIBEDIT_MAJOR +([0-9]+)" "# *define +LIBEDIT_MINOR +([0-9]+)"
)
debug("EDITLINE")

common_find_package(
    REQUIRED
    NAME SQLite3
    LIBRARIES sqlite3
    HEADER sqlite3.h
    OUTPUT_VARIABLE_NAME "SQLITE3"
#     VERSION_REGEXPES "# *define *SQLITE_VERSION_NUMBER *([0-9]+)"
    VERSION_REGEXPES "# *define *SQLITE_VERSION *\"([0-9.]+)\""
)
debug("SQLITE3")
