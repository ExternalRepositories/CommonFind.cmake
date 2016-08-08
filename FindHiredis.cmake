
include(CommonFind)

common_find_package(
    NAME Hiredis
    SUFFIXES hiredis
    LIBRARIES hiredis
    HEADER hiredis.h
    PKG_CONFIG_MODULE_NAME hiredis
    VERSION_REGEXPES "# *define +HIREDIS_MAJOR +([0-9]+)" "# *define +HIREDIS_MINOR +([0-9]+)" "# *define +HIREDIS_PATCH +([0-9]+)"
)
