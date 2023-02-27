#!/usr/bin/env bash

sudo powermetrics -i 2000  --samplers cpu_power | grep --line-buffered -e "Package Power:" -e "CPU Power:" -e "GPU Power:" -e "DRAM Power:"  > /tmp/powermetrics.txt

