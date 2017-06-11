#!/bin/sh
c=0 
while true 
do 
  c=$(($c+1)) 
  echo "$c from $(hostname), it is $(date): $GREETING_MESSAGE" 
  sleep $GREETING_PAUSE 
done | tee -a /tmp/greetings/greetings.txt