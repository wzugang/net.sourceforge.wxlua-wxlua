CMAKE_MINIMUM_REQUIRED(VERSION 3.7)

PROJECT("net.sourceforge.wxlua-lua5.1-wxlua-artifact")

INCLUDE(../../../cmake/version.cmake)

SET(INSTALL_WINDOWS_X86        "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/windows_x86")
SET(INSTALL_WINDOWS_X86_64     "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/windows_x86_64")
SET(INSTALL_UBUNTU_1404_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/ubuntu_1404_x86")
SET(INSTALL_UBUNTU_1404_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/ubuntu_1404_x86_64")
SET(INSTALL_UBUNTU_1604_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/ubuntu_1604_x86")
SET(INSTALL_UBUNTU_1604_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/ubuntu_1604_x86_64")
SET(INSTALL_UBUNTU_1704_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/ubuntu_1704_x86")
SET(INSTALL_UBUNTU_1704_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.1/ubuntu_1704_x86_64")

# Get the version number.
INCLUDE(${INSTALL_WINDOWS_X86}/net.sourceforge.wxlua-wxlua.version)
SET(PROJECT_VERSION "${net.sourceforge.wxlua-wxlua_VERSION}")

SET(CPACK_OUTPUT_FILE_PREFIX targets/jonchki/repository/net/sourceforge/wxlua/wxlua/${PROJECT_VERSION})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME "lua5.1-wxlua-${PROJECT_VERSION}")

SET(CPACK_GENERATOR "TXZ")
INCLUDE(CPack)


#-----------------------------------------------------------------------------
#
# Install the 32bit files.
#
INSTALL(FILES ${INSTALL_WINDOWS_X86}/lua_plugins/libwx.dll
        DESTINATION windows_x86/lua_plugins
        RENAME wx.dll)

INSTALL(FILES ${INSTALL_UBUNTU_1404_X86}/lua_plugins/wx.so
        DESTINATION ubuntu_1404_x86/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1604_X86}/lua_plugins/wx.so
        DESTINATION ubuntu_1604_x86/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1704_X86}/lua_plugins/wx.so
        DESTINATION ubuntu_1704_x86/lua_plugins)


#-----------------------------------------------------------------------------
#
# Install the 64bit files.
#
INSTALL(FILES ${INSTALL_WINDOWS_X86_64}/lua_plugins/libwx.dll
        DESTINATION windows_x86_64/lua_plugins
        RENAME wx.dll)

INSTALL(FILES ${INSTALL_UBUNTU_1404_X86_64}/lua_plugins/wx.so
        DESTINATION ubuntu_1404_x86_64/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1604_X86_64}/lua_plugins/wx.so
        DESTINATION ubuntu_1604_x86_64/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1704_X86_64}/lua_plugins/wx.so
        DESTINATION ubuntu_1704_x86_64/lua_plugins)


#-----------------------------------------------------------------------------

INSTALL(FILES install.lua
        DESTINATION .)

CONFIGURE_FILE(wxlua.xml
               ${CPACK_OUTPUT_FILE_PREFIX}/lua5.1-wxlua-${PROJECT_VERSION}.xml
               @ONLY)


#-----------------------------------------------------------------------------
#
# Filter the pom.xml file.
#
SET(POM_ARTIFACT_ID  "lua5.1-wxlua")
SET(POM_GROUP_ID     "net.sourceforge.wxlua")
SET(POM_VERSION      "${PROJECT_VERSION}")
SET(POM_PACKAGING    "tar.xz")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/pom.xml ${CPACK_OUTPUT_FILE_PREFIX}/lua5.1-wxlua-${PROJECT_VERSION}.pom)
