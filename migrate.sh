#!/usr/bin/env bash

cd ~/.fastdiract
for x in ./fastdirs__*; do
  mv $x ${x/fastdirs/fastdir}
done
rm ./fastdirs
ln -s $(realpath ./fastdir__default) ./fastdir

for x in ./fastactions__*; do
  mv $x ${x/fastactions/fastact}
done
rm ./fastactions
ln -s $(realpath ./fastact__default) ./fastact
