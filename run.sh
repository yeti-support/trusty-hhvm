#!/bin/bash

/usr/sbin/nginx

/usr/bin/hhvm --config /etc/hhvm/php.ini --config /etc/hhvm/server.ini --mode server -vPidFile=/var/run/hhvm/pid
