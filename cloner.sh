#!/bin/bash
# 1, 2, 3 , 4 ,5 is paramenters position when you run command
# @1 public key
# @2 private key
# @3 project name
# @4 ssh url
# @5 pull request id 
# @6 is unique path


echo $1 > ~/.ssh/"id_rsa_$3.pub"
echo -e $2 > ~/.ssh/"id_rsa_$3"

cat ~/.ssh/"id_rsa_$3.pub" >> ~/.ssh/authorized_keys

mkdir -p /var/www/workdir/$6

cd /var/www/workdir/$6 && git clone $4

if [[ $5 =~ ^-?[0-9]+$ ]]; then
   cd /var/www/workdir/$6/$3 && git fetch origin refs/pull/$5/head:framgia-ci && git checkout framgia-ci
else
   cd /var/www/workdir/$6/$3 && git checkout $5
fi

exit