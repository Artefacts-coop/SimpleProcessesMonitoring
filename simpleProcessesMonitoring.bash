#!/bin/bash

LOADAVG5MN_LIMIT=2

LOCALTIME=`date --rfc-3339="seconds"`
HOSTNAME=`hostname`
LOADAVG5MN=`uptime | awk '{print $9}' | cut -d' ' -f2 | cut -d',' -f1-2`
# Enlève dernière virgule (locale FR)
LOADAVG5MN=`echo $LOADAVG5MN | sed 's/,/./'`
# Prend la partie entière
LOADAVG5MN=`echo $LOADAVG5MN | cut -d'.' -f1`

echo LOCALTIME = $LOCALTIME
echo HOSTNAME = $HOSTNAME
echo LOADAVG5MN = $LOADAVG5MN

if [ $LOADAVG5MN -gt $LOADAVG5MN_LIMIT ]
then

# echo AVG over limit

ps -Afl xf | mail -s "$HOSTNAME $0" cyrille@giquello.fr

else

# echo AVG under limit
#top -b -c -n1 2<&1 | mail -s "$HOSTNAME $0" cyrille@giquello.fr

fi
