#!/bin/sh
# Proccesses list
clear;

while :; do clear; ps -eo pid,ppid,%mem,%cpu,comm --sort=-%cpu | head -n 30; sleep 1; done 
echo 0;
