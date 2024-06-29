#!/bin/bash

while true
do
  output=$(adb shell appops get com.kachpara.customer_app)

  if [[ "$output" == *"FINE_LOCATION: ignore"* ]]
  then
    echo "FINE_LOCATION: ignore. Granting permission..."
    (adb shell pm grant com.kachpara.customer_app android.permission.ACCESS_FINE_LOCATION >/dev/null 2>&1) &
    adb_pid=$!
    sleep 1
    while ps -p $adb_pid > /dev/null; do sleep 1; done
  else
    echo "$output"
  fi

  sleep 2
done
