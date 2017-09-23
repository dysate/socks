#!/bin/bash


cp obfs* /usr/local/bin

dpkg -i package/libsodium*

apt-get install apg libc-ares2 libev4 libmbedcrypto0 

dpkg -i package/shadow*
