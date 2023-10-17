FROM git.strypsteen.me/mathieu/alpine
RUN sed -i s/v3.18/edge/ /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk upgrade
