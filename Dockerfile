# use a node base image
FROM wvzuilen/pharo-seaside

# set maintainer
MAINTAINER Wouter van Zuilen (wvzuilen@gmail.com)

COPY /preload.st /pharo
COPY /postload.st /pharo

WORKDIR /pharo
RUN ./pharo Pharo.image st preload.st --save --quit
RUN ./pharo Pharo.image st postload.st --save --quit

CMD ["/pharo/pharo", "Pharo.image","--no-quit"]

# tell docker what port to expose
EXPOSE 8088
