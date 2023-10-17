FROM git.strypsteen.me/mathieu/alpine-testing
RUN apk add postgresql16
USER postgres
CMD postgres -D /var/lib/postgres -k /tmp
