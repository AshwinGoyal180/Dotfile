#!/bin/bash
zpool status > ~/.config/conky/ashwin/zpool_status 
if [ ! -z `cat ~/.config/conky/ashwin/zpool_status | grep "DEGRADED"` ]; then 
	cat ~/.config/conky/ashwin/zpool_status
fi
