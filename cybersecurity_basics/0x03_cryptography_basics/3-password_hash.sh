#!/bin/bash
openssl passwd -6 -salt "$(openssl rand -base64 12)" "$1" > 3_hash.txt
