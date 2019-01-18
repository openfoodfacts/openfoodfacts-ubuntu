FROM clickable/ubuntu-sdk:16.04-armhf

RUN apt update

RUN apt install -y libglib2.0-dev libgdk-pixbuf2.0-dev libcairo2-dev
RUN apt install -y librsvg2-dev
RUN apt install -y libzbar-dev:armhf

RUN apt install -y libjpeg-dev:armhf
RUN apt install -y libv4l-dev:armhf
