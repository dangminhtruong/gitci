#!/bin/bash
mkdir /root/.ssh
echo -e $publicKey > /root/.ssh/id_rsa.pub
echo -e $privateKey > /root/.ssh/id_rsa
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
chmod 644 /root/.ssh/authorized_keys
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tIdentityFile /root/.ssh/id_rsa\n\tAddKeysToAgent yes\n" > /root/.ssh/config
ssh-keyscan github.com > /root/.ssh/known_hosts
chmod -R 644 /root/.ssh/known_hosts
mkdir /root/project
cd /root/project && git clone $cloneUrl
if [[ $target =~ ^-?[0-9]+$ ]]; then
   echo Pullrequest
else
   git checkout $target
fi