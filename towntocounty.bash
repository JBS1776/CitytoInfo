#!/bin/bash

city=$1
state=$2

curl -s https://en.wikipedia.org/wiki/$city$state | pup 'td.infobox-data' | pup -c '[title*=County]'
curl -s https://en.wikipedia.org/wiki/$city$state | pup 'td.infobox-data' | pup -c '[title*=Borough]'
curl -s https://en.wikipedia.org/wiki/$city$state | pup 'td.infobox-data' | pup -c '[title*=Parish]'
