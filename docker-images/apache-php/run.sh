#!/bin/bash

ORIG_UID=$(id -u www-data)
ORIG_GID=$(id -g www-data)
DEV_UID=${DEV_UID:=$ORIG_UID}
DEV_GID=${DEV_GID:=$ORIG_GID}

if [ "$DEV_UID" -ne "$ORIG_UID" ] || [ "$DEV_GID" -ne "$ORIG_GID" ]; then
    groupmod -o -g "$DEV_GID" www-data
    usermod -o -u "$DEV_UID" -g "$DEV_GID" www-data
fi

/usr/sbin/apache2ctl -D FOREGROUND
