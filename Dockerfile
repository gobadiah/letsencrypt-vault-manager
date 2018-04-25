FROM vault:0.10.0 as vault

FROM nginx:1.13

RUN apt-get update && apt-get install -y vim curl wget dnsutils procps

RUN wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto && \
  mv certbot-auto /usr/local/bin/

COPY --from=vault /bin/vault /usr/local/bin/vault

COPY certify /usr/local/bin/
