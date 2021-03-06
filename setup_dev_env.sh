#!/usr/bin/env bash
# Script to simplify local development and debugging. 
# Usage: 
#      $ source setup_dev_env.sh

export PYTHONPATH=${PWD}/src:${PYTHONPATH}

docker build -t quantumleap .

source deps.env

# Aliasing so that notifications from orion container reach dev localhost
LH=192.0.0.1
sudo ifconfig lo0 alias $LH

export ORION_HOST=$LH
export MONGO_HOST=$LH

export QL_HOST=$LH
export CRATE_HOST=$LH
export INFLUX_HOST=$LH
export RETHINK_HOST=$LH

export REDIS_HOST=$LH

pipenv shell
