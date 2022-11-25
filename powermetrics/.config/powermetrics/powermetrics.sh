#!/usr/bin/env bash

sudo powermetrics -i 2000  --samplers cpu_power,network | grep -e "Package Power:" -e "CPU Power:" -e "GPU Power:" -e "DRAM Power:" -e "out:" -e "in:" --line-buffered > /tmp/powermetrics.txt

