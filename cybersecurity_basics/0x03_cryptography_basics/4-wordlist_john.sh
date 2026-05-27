#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=raw-sha256 > /dev/null
john --show "$1" --format=raw-sha256 | cut -d ':' -f 2 > 4-password.txt
