#Open Food Facts for Ubuntu Touch
An implementation of Open Food Facts database to Ubuntu touch devices.

# Developpers and contributors
- Nymerea
- sy-per

#License
This application is released under the term of the GNU GENERAL PUBLIC LICENSE Version 3.<br>
See file [gpl-3.0.txt](gpl-3.0.txt) for details.

#Dependencies
Don't forget to install dependencies because the barcode detector uses static linkage

clickable.json
`{
    "dependencies": [
        "libjpeg-dev",
        "libzbar0",
        "zbar-tools",
        "libzbar-dev",
        "libv4l-dev",
        "libqrencode-dev"
    ]
}`

If you want publish your application on smartphone, create your docker image manually and don't forget to install dependencies on your kit with Dockerfile

Dockerfile
`
FROM clickable/ubuntu-sdk:16.04-armhf

RUN apt update

RUN apt install -y libglib2.0-dev libgdk-pixbuf2.0-dev libcairo2-dev
RUN apt install -y librsvg2-dev
RUN apt install -y libzbar-dev:armhf

RUN apt install -y libjpeg-dev:armhf
RUN apt install -y libv4l-dev:armhf
`

Terminal :
`
docker build ./ -t ut16.04-zbar
`


clickable.json
`{
    "docker_image":"ut16.04-zbar",
    "dependencies": [
        "libjpeg-dev:armhf",
        "libzbar0:armhf",
        "zbar-tools:armhf",
        "libzbar-dev:armhf",
        "libv4l-dev:armhf",
        "libqrencode-dev:armhf"
    ]
}`

# Official Documentation of the Open Food Facts API
The official documentation for API : https://en.wiki.openfoodfacts.org/Project:API

# Help translate the app 
You can help translate Open Food Facts and the app at (no technical knowledge required, takes a minute to signup): 
- https://translations.launchpad.net/openfoodfacts/trunk/+pots/openfoodfacts-ubuntu-mobile

**Status**
===

[![Project Status](http://opensource.box.com/badges/active.svg)](http://opensource.box.com/badges)
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/openfoodfacts/openfoodfacts-ubuntu.svg)](http://isitmaintained.com/project/openfoodfacts/openfoodfacts-ubuntu.svg "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/openfoodfacts/openfoodfacts-ubuntu.svg)](http://isitmaintained.com/project/openfoodfacts/openfoodfacts-ubuntu.svg "Percentage of issues still open")


# Useful links

- JSON formater (for visualising JSON data) : https://jsonformatter.curiousconcept.com/

- How to read a JSON API in QML : https://morgan-durand.com/parser-une-api-json-dans-un-listview/

- Navigate between pages with Ubuntu Touch : https://morgan-durand.com/creation-dune-application-ubuntu-jour-4/



