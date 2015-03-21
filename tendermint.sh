#!/bin/bash -x

# This part is for installing go language and setting up a user account
sudo apt-get install -y make screen gcc git mercurial libc6-dev pkg-config libgmp-dev python-software-properties bison
[ -x $(which gvm) ] || bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4.2
export PATH=/home/mpwd/.gvm/pkgsets/go1.4.2/global/bin:$PATH
export GOPATH=/home/mpwd/.gvm/pkgsets/go1.4.2/global
go get github.com/tendermint/tendermint
(cd $GOPATH/src/github.com/tendermint/tendermint ; git checkout vm_app_state ; git pull origin vm_app_state)
make -C $GOPATH/src/github.com/tendermint/tendermint
$GOPATH/src/github.com/tendermint/tendermint/tendermint daemon
