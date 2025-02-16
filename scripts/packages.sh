#!/bin/bash

# Get CPU Vendor
cpu=$(grep -m 1 'vendor_id' /proc/cpuinfo | awk '{print $NF}')
case ${cpu} in
  AuthenticAMD) SYSTEM+=("amd-ucode") ;;
  GenuineIntel) SYSTEM+=("intel-ucode") ;;
  *) exit 0 ;;
esac
