#!/usr/bin/env bash

set -e

echo "Сhecks of existence config dir..."
if [ ! -d "/etc/bind" ]; then
    echo "Config dir is not found!!! Recovery from original default config..."
    cp -R /etc/bind.origin /etc/bind
fi

echo "Checks of empty config dir..."
if [ -z "$(ls -A /etc/bind)" ]; then
    echo "Config dir is empty!!! Recovery from original default config..."
    cp -R /etc/bind.origin/* /etc/bind
fi

echo "Executing command..."
exec $@
