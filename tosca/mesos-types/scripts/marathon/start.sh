#!/bin/bash -e

# Starting marathon as sudo while retaining environment variables
# TODO: Workaround : cfy replaces commas with whitespaces
export MARATHON_MASTER=$(echo $MARATHON_MASTER | tr " " ",")
export MARATHON_ZK=$(echo $MARATHON_ZK | tr " " ",")
sudo -E nohup marathon 0</dev/null &>/dev/null &
sleep 5

ps -ef | grep -v grep | grep marathon >/dev/null || (echo "Failed to start marathon"; exit 1)