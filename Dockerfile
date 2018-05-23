FROM vault:0.10.0 as vault

FROM nginx:1.13

RUN apt-get update && apt-get install -y vim curl wget dnsutils procps jq sudo cron zsh syslog-ng

RUN wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto && \
  mv certbot-auto /usr/local/bin/

COPY --from=vault /bin/vault /usr/local/bin/vault

RUN curl https://raw.githubusercontent.com/gobadiah/devops-toolbox/develop/install.sh | sudo bash

COPY bin/certify /usr/local/bin/
COPY bin/renew /usr/local/bin/
COPY bin/renew /etc/cron.daily/renew
COPY ttl.py /root/ttl.py

CMD cron && nginx -g "daemon off;"
