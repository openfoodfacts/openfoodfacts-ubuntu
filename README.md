#OpenFoodFacts Ubuntu Touch
An implementation of OpenFoodFacts database to Ubuntu touch devices.

#Dependences
Don't forget to install dependences because the barcode detector use static linkage

`sudo apt-get install libjpeg-dev libzbar0 zbar-tools  libzbar-dev libv4l-dev libqrencode-dev`

If you want publish your application on smartphone, don't forget to install dependences on your kit  
qt creator -> option -> ubuntu -> choose your click and click on "maintain"  
`sudo apt-get install libjpeg-dev:armhf libzbar0:armhf zbar-tools:armhf  libzbar-dev:armhf libv4l-dev:armhf libqrencode-dev:armhf`
after executing this, in your regular console execute : 
`click-chroot-agent -r` it will reload your qtcreator (sort of)

# Api Official Documentation
The official documentation for API : http://en.wiki.openfoodfacts.org/Project:API


#Usefull link 

- JSON formater (for visualising json data) : http://jsonformatter.curiousconcept.com/

- how read JSON API in QML : http://morgan-durand.com/parser-une-api-json-dans-un-listview/

- Navigate between page with ubuntu touch : http://morgan-durand.com/creation-dune-application-ubuntu-jour-4/



