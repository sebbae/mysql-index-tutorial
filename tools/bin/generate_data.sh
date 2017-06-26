#!/bin/bash
pushd /tools/dbgen 
mkdir -p /data \
	&& ./dbgen \
	&& mv *.tbl /data
popd

