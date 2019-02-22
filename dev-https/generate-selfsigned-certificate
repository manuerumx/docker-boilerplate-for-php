#!/usr/bin/env bash

HOSTNAME=$1

if [[ ! $HOSTNAME ]]; then
	echo 'Usage:'
	echo '        generate-selfsigned-certificate [hostname]'
	echo
	echo 'Example:'
	echo '        generate-selfsigned-certificate project.development.local'
	exit
fi


# See https://letsencrypt.org/docs/certificates-for-localhost/

openssl req -x509 -out $HOSTNAME.crt -keyout $HOSTNAME.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj "/CN=$HOSTNAME" -extensions EXT -config <( \
   printf "[dn]\nCN=$HOSTNAME\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:$HOSTNAME\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")


#openssl req -x509 -out project.development.local.crt -keyout project.development.local.key \
#  -newkey rsa:2048 -nodes -sha256 \
#  -subj '/CN=project.development.local' -extensions EXT -config <( \
#   printf "[dn]\nCN=project.development.local\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:project.development.local\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
