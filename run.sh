#!/bin/bash

/usr/sbin/nginx

/usr/bin/hhvm --config /etc/hhvm/php.ini --config /etc/hhvm/server.ini --mode daemon -vPidFile=/var/run/hhvm/pid
