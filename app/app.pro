TARGET = openFoodFacts

QT += quick widgets network

#load Ubuntu specific features
load(ubuntu-click)

INCLUDEPATH += /usr/include/
INCLUDEPATH += /usr/include/zbar/

#desktop usage
#LIBS += /usr/lib/x86_64-linux-gnu/libzbar.a -lv4l2 -ljpeg

#phone usage
LIBS += /usr/lib/libzbar.a -lv4l2 -ljpeg

SOURCES += main.cpp \
            qrcodereader.cpp \
    product.cpp

HEADERS += qrcodereader.h \
    product.h

RESOURCES += \
            qml.qrc


# Install files into the click package
message("installing to $${UBUNTU_CLICK_BINARY_PATH}")
target.path = $${UBUNTU_CLICK_BINARY_PATH}
icon.files = ../OpenFoodFacts/OpenFoodFacts.png
icon.path = /
desktopfile.files = ../OpenFoodFacts/OpenFoodFacts.desktop
desktopfile.path = /
apparmor.files = ../OpenFoodFacts/OpenFoodFacts.apparmor
apparmor.path = /

INSTALLS += icon desktopfile apparmor target


#This creates the manifest.json file, it is the description file for the
#click package.

#figure out the current build architecture
CLICK_ARCH=$$system(dpkg-architecture -qDEB_HOST_ARCH)

#do not remove this line, it is required by the IDE even if you do
#not substitute variables in the manifest file
UBUNTU_MANIFEST_FILE = $$PWD/../manifest.json.in

# substitute the architecture in the manifest file
manifest_file.output   = manifest.json
manifest_file.CONFIG  += no_link \
                         add_inputs_as_makefile_deps\
                         target_predeps
manifest_file.commands = sed s/@CLICK_ARCH@/$$CLICK_ARCH/g ${QMAKE_FILE_NAME} > ${QMAKE_FILE_OUT}
manifest_file.input = UBUNTU_MANIFEST_FILE
QMAKE_EXTRA_COMPILERS += manifest_file

#installation path of the manifest file
mfile.path = /
mfile.CONFIG += no_check_exist
mfile.files  += $$OUT_PWD/manifest.json
INSTALLS+=mfile

DISTFILES += \
    ../OpenFoodFacts/OpenFoodFacts.desktop
