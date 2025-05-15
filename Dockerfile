FROM golang:alpine3.21
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo
RUN apk add git
RUN apk add nodejs npm
VOLUME [ "/site" ]
WORKDIR /site
EXPOSE 1313
CMD npm i && hugo server --bind "0.0.0.0"
