#!/bin/sh

# dep
go get -u github.com/golang/dep/cmd/dep

# mage
go get -u -d github.com/magefile/mage
cd $GOPATH/src/github.com/magefile/mage
go run bootstrap.go
cd -

# gometalinter
go get -u gopkg.in/alecthomas/gometalinter.v2
