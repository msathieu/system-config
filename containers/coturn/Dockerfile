FROM git.strypsteen.me/mathieu/alpine
RUN apk add coturn
USER turnserver
CMD turnserver --log-file=stdout --listening-ip=0.0.0.0 --listening-ip=:: --min-port=50000 --max-port=50100 --no-dtls --no-multicast-peers --no-rfc5780 --no-stun-backward-compatibility --no-tcp-relay --no-tls --realm=strypsteen.me --response-origin-only-with-rfc5780 --static-auth-secret=$COTURN_SECRET --total-quota=16 --use-auth-secret
