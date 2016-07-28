
include(CommonFind)

common_find_package(
    NAME Edit
    LIBRARIES edit
    HEADER histedit.h
    PKG_CONFIG_MODULE_NAME libedit
#     OUTPUT_VARIABLE_NAME "EDITLINE"
#     VERSION_REGEXPES "# *define +LIBEDIT_MAJOR +([0-9]+)" "# *define +LIBEDIT_MINOR +([0-9]+)"
)
