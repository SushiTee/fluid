TEMPLATE = lib
TARGET = fluidcoreplugin
TARGETPATH = Fluid/Core
IMPORT_VERSION = 1.0

QT += qml quick

HEADERS += \
    $$files($$PWD/*.h)

SOURCES += \
    $$files($$PWD/*.cpp)

QML_FILES += \
    $$files($$PWD/*.qml)

INCLUDEPATH += $$PWD

CONFIG += no_cxx_module
load(qml_plugin)

INSTALLS -= target qmldir qmlfiles

android:equals(QMAKE_HOST.os, Windows):QMAKE_MOVE = cmd /c move

# Copy all files to the build directory so that QtCreator will recognize
# the QML module and the demo will run without installation
qmlfiles2build.files = $$QML_FILES
qmlfiles2build.path = $$DESTDIR
COPIES += qmlfiles2build
