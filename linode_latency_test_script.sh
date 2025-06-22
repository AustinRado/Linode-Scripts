#!/bin/bash

echo "Testing latency to various Linode data centers from Kenya..."
declare -A LOCATIONS=(
  ["Frankfurt"]="speedtest.frankfurt.linode.com"
  ["London"]="speedtest.london.linode.com"
  ["Mumbai"]="speedtest.mumbai1.linode.com"
  ["Singapore"]="speedtest.singapore.linode.com"
  ["Newark"]="speedtest.newark.linode.com"
  ["Fremont"]="speedtest.fremont.linode.com"
  ["Atlanta"]="speedtest.atlanta.linode.com"
  ["Dallas"]="speedtest.dallas.linode.com"
  ["Toronto"]="speedtest.toronto1.linode.com"
  ["Tokyo"]="speedtest.tokyo2.linode.com"
  ["Sydney"]="speedtest.sydney1.linode.com"
)

for location in "${!LOCATIONS[@]}"; do
  echo "------------------------------------------"
  echo "Pinging $location (${LOCATIONS[$location]})..."
  ping -c 4 -q "${LOCATIONS[$location]}" | tail -3
done

echo "------------------------------------------"
echo "Done. Lower average latency = better performance."

