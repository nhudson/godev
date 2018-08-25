#!/bin/sh

set -e

ZSH=/root/.oh-my-zsh

cp -R /tmp/.ssh /root/.ssh

chmod 0700 /root/.ssh
chmod 0644 /root/.ssh/id_rsa.pub
chmod 0600 /root/.ssh/id_rsa
chmod 0600 /root/.ssh/config

rm -fr /root/.zcompdump*

exec "$@"
