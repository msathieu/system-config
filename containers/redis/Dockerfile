FROM git.strypsteen.me/mathieu/alpine
RUN apk add redis
USER redis
CMD redis-server --dir /var/lib/redis --protected-mode no
