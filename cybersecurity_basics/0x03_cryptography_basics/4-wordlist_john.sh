echo '#!/bin/bash' > 4-wordlist_john.sh
echo 'john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=raw-sha256 > /dev/null; john --show "$1" --format=raw-sha256 | cut -d ":" -f 2 > 4-password.txt' >> 4-wordlist_john.sh
