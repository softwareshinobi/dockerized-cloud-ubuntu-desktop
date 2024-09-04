#!/bin/bash

set -e

set -x

##
## create the apps dir and populate with unzipped netbeans content
##

ls

mkdir /apps

cd /apps

##

ls

wget https://dlcdn.apache.org/netbeans/netbeans/21/netbeans-21-bin.zip

ls

mv netbeans-21-bin.zip netbeans.zip

ls

unzip netbeans.zip

ls

pwd

##
##
##
