#!/bin/bash

set -e
set -x

echo "Installing php dependencies with composer ..."
composer install

if [ ! -f etc/config.php ]; then
  echo "Copying etc/template.config.php to etc/config.php"
  cat etc/template.config.php |\
  set -e 's/your_mysql_password/lamproot/' >\
  etc/config.php
fi
