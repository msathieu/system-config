FROM git.strypsteen.me/mathieu/alpine
RUN sed -i s/v3.18/edge/ /etc/apk/repositories
RUN apk upgrade
RUN apk add postgresql16
USER postgres
CMD postgres -D /var/lib/postgres -k /tmp
