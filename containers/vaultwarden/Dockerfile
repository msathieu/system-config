FROM git.strypsteen.me/mathieu/alpine-testing
RUN apk add vaultwarden vaultwarden-web-vault
USER vaultwarden
ENV WEB_VAULT_FOLDER=/usr/share/webapps/vaultwarden-web
ENV DOMAIN=https://vault.strypsteen.me
ENV ROCKET_ADDRESS=0.0.0.0
ENV LOG_LEVEL=warn
ENV SIGNUPS_ALLOWED=false
ENV TRASH_AUTO_DELETE_DAYS=14
CMD vaultwarden
