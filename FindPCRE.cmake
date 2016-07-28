
include(CommonFind)

common_find_package(
    NAME PCRE
    LIBRARIES pcre
    HEADER pcre.h
#     OUTPUT_VARIABLE_NAME "PCRE"
    PKG_CONFIG_MODULE_NAME libpcre
#     CONFIG_EXECUTABLE pcre-config
    VERSION_REGEXPES "# *define +PCRE_MAJOR +([0-9]+)" "# *define +PCRE_MINOR +([0-9]+)"
)
