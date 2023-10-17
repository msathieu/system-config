FROM git.strypsteen.me/mathieu/alpine
RUN apk add monero
USER 100:101
CMD monerod --non-interactive --prune-blockchain --rpc-restricted-bind-ip=0.0.0.0 --rpc-restricted-bind-port=18089
