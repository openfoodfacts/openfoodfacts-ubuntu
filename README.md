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

`sudo apt-get install libjpeg-dev libzbar0 zbar-tools  libzbar-dev libv4l-dev libqrencode-dev`

If you want publish your application on smartphone, don't forget to install dependencies on your kit  
Qt Creator -> Option -> Ubuntu -> Choose your click and click on "Maintain"  
`sudo apt-get install libjpeg-dev:armhf libzbar0:armhf zbar-tools:armhf  libzbar-dev:armhf libv4l-dev:armhf libqrencode-dev:armhf`
after executing this, in your regular console execute : 
`click-chroot-agent -r` it will reload your qtcreator (sort of)

# Official Documentation of the Open Food Facts API
The official documentation for API : http://en.wiki.openfoodfacts.org/Project:API

# Help translate the app 
You can help translate Open Food Facts and the app at (no technical knowledge required, takes a minute to signup): 
- https://translations.launchpad.net/openfoodfacts/trunk/+pots/openfoodfacts-ubuntu-mobile

**Status**
===

[![Project Status](http://opensource.box.com/badges/active.svg)](http://opensource.box.com/badges)
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/openfoodfacts/openfoodfacts-ubuntu.svg)](http://isitmaintained.com/project/openfoodfacts/openfoodfacts-ubuntu.svg "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/openfoodfacts/openfoodfacts-ubuntu.svg)](http://isitmaintained.com/project/openfoodfacts/openfoodfacts-ubuntu.svg "Percentage of issues still open")


# Useful links

- JSON formater (for visualising JSON data) : http://jsonformatter.curiousconcept.com/

- How to read a JSON API in QML : http://morgan-durand.com/parser-une-api-json-dans-un-listview/

- Navigate between pages with Ubuntu Touch : http://morgan-durand.com/creation-dune-application-ubuntu-jour-4/



