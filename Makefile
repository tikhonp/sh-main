# Makefile for obtaining and renewing letsencrypt certs (standalone for first obtain,
# webroot renew via docker-compose when nginx is serving the webroot)

CERTBOT_IMAGE := certbot/certbot:v5.1.0
CERTBOT_VOLUME := main-proxy-certbot-certs
WEBROOT_VOLUME := main-proxy-certbot-webroot

# list of domains (single domain per target)
DOMAINS := \
	tikhonnnnn.com \
	mountainteaband.ru \
	mykpp.online \
	photos.tikhonnnnn.com \
	files.tikhonnnnn.com \
	dozzle.tikhonnnnn.com \
	secrets.tikhonnnnn.com \

EMAIL := tikhon.petrishchev@gmail.com

.PHONY: all $(DOMAINS)

all: $(DOMAINS)

# Obtain a certificate using standalone (binds :80) — useful for first issuance
# Example usage: make tikhonnnnn.com
$(DOMAINS):
	@echo "=== Obtaining certificate for $@ ==="
	docker run --rm -it \
		-p 80:80 \
		-v $(CERTBOT_VOLUME):/etc/letsencrypt \
		-v /var/log/letsencrypt:/var/log/letsencrypt \
		$(CERTBOT_IMAGE) certonly -v --standalone \
		--non-interactive --agree-tos \
		--email $(EMAIL) \
		--cert-name $@ -d $@
