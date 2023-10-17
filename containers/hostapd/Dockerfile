FROM git.strypsteen.me/mathieu/alpine
RUN apk add hostapd
RUN chown 5000 /etc/hostapd
COPY --chown=5000 hostapd.conf /etc/hostapd/hostapd.conf
CMD sed s/REPLACEME/$PASSWORD/ -i /etc/hostapd/hostapd.conf && hostapd /etc/hostapd/hostapd.conf
