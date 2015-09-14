#!/bin/bash

fifo_name="events";

[ -p $fifo_name ] || mkfifo $fifo_name;

while true
do
  if read line <$fifo_name; then
    echo $line
  fi
done
