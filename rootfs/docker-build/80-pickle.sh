#!/usr/bin/env bash

set -e

curl -LsS "https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar" -o "/usr/local/bin/pickle"
chmod +x "/usr/local/bin/pickle"

