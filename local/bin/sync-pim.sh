#!/bin/bash

# Sync calendar and contacts via vdirsyncer

source notify.sh

# Run only if user logged in (prevent cron errors)
pgrep -u "${USER:=$LOGNAME}" >/dev/null || { echo "$USER not logged in; sync will not run."; exit ;}
# Run only if not already running in other instance
pgrep -x vdirsyncer >/dev/null && { echo "vdirsyncer is already running." ; exit ;}

SYNC_INTERVAL=3600

while true
do
  vdirsyncer sync &>/dev/null; [ $? -eq 0 ] && : || notify "PIM Sync failed!"
  sleep $SYNC_INTERVAL
done

