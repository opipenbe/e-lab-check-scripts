#!/bin/bash


# Created by Olari Pipenberg. 
# Feel free to change, add, and remove any part of this script.
# Error codes:
#       1 - Insufficient privileges

# Check privileges
if [ $"$EUID" -ne 0 ]; then
        echo "Insufficient privileges"
        exit 1
fi

for ns in $(ip netns show)
do
	/sbin/ip netns delete "$ns"
done

