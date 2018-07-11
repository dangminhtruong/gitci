#!/bin/bash
mkdir /root/.ssh
CACHE_DIR="/root/cache/"
PROJECT_DIR="/root/project"
echo -e $publicKey > /root/.ssh/id_rsa.pub
echo -e $privateKey > /root/.ssh/id_rsa
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tIdentityFile /root/.ssh/id_rsa\n\tAddKeysToAgent yes\n" > /root/.ssh/config
ssh-keyscan github.com > /root/.ssh/known_hosts
chmod -R 644 /root/.ssh/known_hosts

if [ ! -d $PROJECT_DIR ]; then
  mkdir $PROJECT_DIR
fi

chmod -R 777 $PROJECT_DIR
cd $PROJECT_DIR && git clone $cloneUrl

if [[ $target =~ ^-?[0-9]+$ ]]; then
   cd $projectName && git fetch origin refs/pull/$target/head:framgia-ci && git checkout framgia-ci
else
   cd $projectName && git checkout $target
fi

if [[ $cache && "$(ls -A $CACHE_DIR)" ]]; then
    echo "<strong style='color:#6a6b6d;'>Loading from cache...</strong>"
    unzip -qo /root/cache/cache.zip -d /root/project/$projectName
    chmod -R 777 /root/project/$projectName
fi