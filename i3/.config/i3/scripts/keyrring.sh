#!/bin/bash
export $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
