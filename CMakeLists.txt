# project name
project (pushjet)

# the oldest stable cmake version we support
cmake_minimum_required (VERSION 2.6)

# tell cmake where its modules can be found in our project directory
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# where we install data directory (if we have any)
set (DATADIR ${CMAKE_INSTALL_PREFIX}/share)

# what to call that directory where we install data too
set (PKGDATADIR ${DATADIR}/${CMAKE_PROJECT_NAME})

set (EXEC_NAME "pushjet")
set (RELEASE_NAME "dev")
set (VERSION "0.0")
set (VERSION_INFO "Development")

set(ICON_DIR ${PKGDATADIR}/icons/)
configure_file(${CMAKE_SOURCE_DIR}/src/config.vala.cmake ${CMAKE_SOURCE_DIR}/src/config.vala)

# we're about to use pkgconfig to make sure dependencies are installed so let's find pkgconfig first
find_package(PkgConfig)

# now let's actually check for the required dependencies
pkg_check_modules(
  DEPS
  REQUIRED
  glib-2.0
  gtk+-3.0
  granite
)

add_definitions(${DEPS_CFLAGS})
link_libraries(${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

# make sure we have vala
find_package(Vala REQUIRED)
# make sure we use vala
include(ValaVersion)
# make sure it's the desired version of vala
ensure_vala_version("0.16" MINIMUM)

# files we want to compile
include(ValaPrecompile)
vala_precompile(VALA_C ${EXEC_NAME}
  src/config.vala
  src/pushjet.vala
  src/window.vala
  src/welcomeview.vala


  # tell what libraries to use when compiling
PACKAGES
  glib-2.0
  gtk+-3.0
  granite
)

# tell cmake what to call the executable we just made
add_executable(${EXEC_NAME} ${VALA_C})

# install the binaries we just made
install (TARGETS ${EXEC_NAME} RUNTIME DESTINATION bin)

# install our .desktop file so the Applications menu will see it
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/pushjet.desktop DESTINATION ${DATADIR}/applications/)

# install our application icons
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/icons/48/pushjet-icon.png DESTINATION share/icons/hicolor/48x48/apps)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/icons/24/pushjet-indicator.svg DESTINATION share/icons/hicolor/24x24/apps)
