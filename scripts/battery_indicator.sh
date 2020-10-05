#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

FULL_BATT=' '
MED_BATT=' ' 
LOW_BATT=' '
BATT_LEVEL=$(pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';')

if [[ ${BATT_LEVEL//%} -gt 75 ]] ; then
    echo -n "#[fg=colour02] ${BATT_LEVEL} ${FULL_BATT}" 
elif [[ ${BATT_LEVEL//%} -gt 25 ]] ; then
    echo -n "#[fg=colour03] ${BATT_LEVEL} ${MED_BATT}" 
elif [[ ${BATT_LEVEL//%} -gt 0 ]] ; then
    echo -n "#[fg=colour09] ${BATT_LEVEL} ${LOW_BATT}" 
fi

