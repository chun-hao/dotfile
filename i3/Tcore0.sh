#!/bin/sh
sensors | awk '/Core 0/ {gsub(/\+/,"",$3); gsub(/\..+/,"",$3); print $3}'
