FROM debian:stretch-slim

MAINTAINER Roni Kumar Saha <roni.csed@gmail.com>

## Install SSH Client
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends samba-common-bin; \
	rm -rf /var/lib/apt/lists/*

