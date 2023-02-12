#!/usr/bin/env bash

if ! spotifyctl status --format '%title%' --max-length 50 -q
then
  echo "No Music"
fi