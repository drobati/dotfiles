#!/usr/bin/env bash

ssh robati-tun 'perl -e "\$|++; while(1) { print \"Maint: \$i\\r\"; \$i++; sleep 1;}"'
