
include(CommonFind)

common_find_package(
    NAME MySQL
    SUFFIXES mysql
    LIBRARIES mysqlclient
    HEADER mysql_version.h
    PKG_CONFIG_MODULE_NAME mysqlclient
    CONFIG_EXECUTABLE mysql_config
        CONFIG_EXECUTABLE_LIBRARIES_ARGUMENTS "--variable=pkglibdir"
        CONFIG_EXECUTABLE_INCLUDE_ARGUMENTS "--variable=pkgincludedir"
    VERSION_REGEXPES "#[ \t]*define[ \t]+MYSQL_VERSION_ID[ \t]+([0-9]+)"
)

message("MySQL_FIND_VERSION = ${MySQL_FIND_VERSION}")
message("MySQL_FIND_VERSION_EXACT = ${MySQL_FIND_VERSION_EXACT}")
message("MySQL_FIND_COMPONENTS = ${MySQL_FIND_COMPONENTS}")
message("MySQL_FIND_REQUIRED = ${MySQL_FIND_REQUIRED}")
message("MySQL_FIND_QUIETLY = ${MySQL_FIND_QUIETLY}")
