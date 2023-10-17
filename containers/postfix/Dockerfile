FROM git.strypsteen.me/mathieu/alpine
RUN apk add postfix
COPY postfix /etc/postfix
RUN sed "s/#submissions/submissions/" -i /etc/postfix/master.cf
RUN sed "s/#  -o smtpd_tls_wrappermode/  -o smtpd_tls_wrappermode/" -i /etc/postfix/master.cf
CMD postfix start-fg
