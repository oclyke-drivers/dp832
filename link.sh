#!/usr/bin/bash

PROJECT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null \
	     && pwd 2> /dev/null; )";

UDEV_RULES_FILENAME="/etc/udev/rules.d/usbtmc_rigoldp832.rules"

# Create the rules.
if [ -f $UDEV_RULES_FILENAME ]; then
	echo "Creating a backup of $UDEV_RULES_FILENAME"
	sudo mv $UDEV_RULES_FILENAME "$UDEV_RULES_FILENAME.backup"
fi

ls /dev/usbtmc* > /dev/null 2>&1
DEVICE_FOUND=$?

sudo ln -s $PROJECT_DIR/usbtmc.rules $UDEV_RULES_FILENAME
sudo udevadm control --reload-rules
sudo udevadm trigger

if [ "$DEVICE_FOUND" = "0" ]; then
	echo "Please reconnect the DP832 device now."
fi
