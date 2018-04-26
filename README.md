# letsencrypt-vault-manager

This docker image contains nginx, vault and certbot-auto. It has two purposes : certifying new
domains and renewing them.

To do that, there is a nginx instance running continuously, used to validate domains, and a cronjob
running daily to renew certificates.

Certificates are stored inside a vault instance, under `secret/certs/host`.

## Requirements

* `VAULT_ADDR` and `VAULT_TOKEN` environment variables with `write` access to `secret/certs`.
* A way to point to your domains to this instance.

## TODO

* In order to fully automates certification, include an aws composent for modifying route 53
recordsets on the fly, and setting them back up just right after certification.

- enable k8s backend
- create service account for letsencrypt-vault-manager
- create vault policy for letsencrypt-vault-manager service account
- create aws user for vault
- enable aws backend
- create role in aws vault for manipulating route53
- make dockerfile for:
  - requesting vault token from service account token
  - using consul-template to launch nginx with ssl certificates
  - populate container env vars with aws credentials (and vault token / vault addr)
