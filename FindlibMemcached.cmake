
include(CommonFind)

common_find_package(
    NAME libMemcached
    SUFFIXES "libmemcached-1.0"
    LIBRARIES memcached
    HEADER memcached.h
    PKG_CONFIG_MODULE_NAME libmemcached
    VERSION_REGEXPES "# *define +LIBMEMCACHED_VERSION_STRING *\"([0-9.]+)\""
)
