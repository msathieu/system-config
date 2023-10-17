FROM git.strypsteen.me/mathieu/alpine
RUN apk add synapse
COPY --chown=synapse homeserver.yaml /etc/synapse/homeserver.yaml
COPY log_config.yaml /etc/synapse/log_config.yaml
USER synapse
CMD sed s/DB_PASS/$DB_PASS/ -i /etc/synapse/homeserver.yaml && sed s/TURN_SECRET/$TURN_SECRET/ -i /etc/synapse/homeserver.yaml && synapse_homeserver -c /etc/synapse/homeserver.yaml
