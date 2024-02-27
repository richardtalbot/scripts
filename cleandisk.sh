#!/bin/bash
#Script by Rick Talbot, 2024. Public domain. Use at own risk.
#This script cleans up APT, purges /tmp/, and cleans up the ext journal

echo "Starting disk usage:"
df -lh | grep nvme0n1p4

Echo "Apt cache size before:"
sudo du -sh /var/cache/apt #show size of apt cache
sudo apt autoremove  #remove unused packages
sudo apt clean  #remove apt cache
echo "Apt cache size after:"
sudo du -sh /var/cache/apt #show size of apt cache

echo "tmp before:"
sudo du -sh /tmp/ #show size of temp files
sudo rm /tmp/* #delete temp files
echo "tmp after:"
sudo du -sh /tmp/ #show size of temp files

echo "Journal size before:"
sudo journalctl --disk-usage

sudo journalctl --flush
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s

echo "Jounral size after:"
sudo journalctl --disk-usage

echo "Ending disk usage:"
df -lh | grep nvme0n1p4
