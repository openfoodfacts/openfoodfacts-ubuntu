TEMPLATE = aux
TARGET = OpenFoodFacts

RESOURCES += OpenFoodFacts.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  OpenFoodFacts.apparmor \
               hub.json \
               OpenFoodFacts.desktop.desktop \
               OpenFoodFacts.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES}

#specify where the qml/js files are installed to
qml_files.path = /OpenFoodFacts
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /OpenFoodFacts
config_files.files += $${CONF_FILES}

INSTALLS+=config_files qml_files



