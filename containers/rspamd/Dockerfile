FROM git.strypsteen.me/mathieu/alpine
RUN apk add rspamd
COPY local.d /etc/rspamd/local.d
COPY override.d /etc/rspamd/override.d
USER rspamd
CMD rspamd --no-fork
