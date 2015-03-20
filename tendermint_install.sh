#!/bin/bash

#This part is for installing go language and setting up a user account
apt-get update -y
apt-get upgrade -y
apt-get install -y make screen gcc git mercurial libc6-dev pkg-config libgmp-dev
mkdir /home/zack
cd /home/zack
mkdir gocode
wget https://storage.googleapis.com/golang/go1.4.2.src.tar.gz
tar -xzvf go*.tar.gz
cd go/src
./make.bash
useradd zack -d /home/zack
cd /home/zack
cp /etc/skel/.bashrc .
mkdir -p /home/zack/go/src
echo 'export GOROOT=/home/zack/go' >> /home/zack/.bashrc
echo 'export GOPATH=/home/zack/gocode' >> /home/zack/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin' >> /home/zack/.bashrc
reset
#after it freezes, start here.
#This part installs tendermint
source /home/zack/.bashrc
go get github.com/tendermint/tendermint

cd $GOPATH/src/github.com/tendermint/tendermint
git checkout new_evm
make get_deps
make
#chown zack /home/zack
#chown zack /home/zack/*
