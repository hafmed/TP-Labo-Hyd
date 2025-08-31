cmake_minimum_required(VERSION 3.16)

project(tp_labo_hyd VERSION 1.9.7 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Charts Core Gui Qml Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

set(CMAKE_AUTORCC ON)

qt_add_executable(apptp_labo_hyd
    qmltp_labo_hyd.qrc
    imagestp_labo_hyd.qrc
    main.cpp
)
set(ANDROID_PACKAGE_SOURCE_DIR ${PROJECT_SOURCE_DIR}/android CACHE INTERNAL "")


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptp_labo_hyd PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptp_labo_hyd
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE

    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android

    # QT_ANDROID_MIN_SDK_VERSION 21
    # QT_ANDROID_TARGET_SDK_VERSION 35
)

target_link_libraries(apptp_labo_hyd PUBLIC
    Qt::Charts
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Qt6::QuickControls2
)

qt_add_qml_module(apptp_labo_hyd
    URI tp_labo_hyd
    VERSION 1.0
#    QML_FILES qmltp_labo_hyd.qrc imagestp_labo_hyd.qrc
    SOURCES calculhaf.h calculhaf.cpp
    SOURCES fparser.cc fpoptimizer.cc fpconfig.hh fparser.hh
    SOURCES
    RESOURCES
    QML_FILES
)

include(GNUInstallDirs)
install(TARGETS apptp_labo_hyd
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

#install(FILES ${PROJECT_SOURCE_DIR}/io.github.hafmed.TP-Labo-Hyd.metainfo.xml DESTINATION $ENV{HOME}/.local/app/share/metainfo/io.github.hafmed.TP-Labo-Hyd.metainfo.xml)

install(FILES "${PROJECT_SOURCE_DIR}/io.github.hafmed.TP-Labo-Hyd.metainfo.xml"
        DESTINATION "$ENV{HOME}/.local/app/share/metainfo")
install(FILES "${PROJECT_SOURCE_DIR}/io.github.hafmed.TP-Labo-Hyd.desktop"
        DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications")
install(FILES "${PROJECT_SOURCE_DIR}/io.github.hafmed.TP-Labo-Hyd.metainfo.xml"
        DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo")
install(FILES "${PROJECT_SOURCE_DIR}/io.github.hafmed.TP-Labo-Hyd.png"
        DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/256x256/apps")
