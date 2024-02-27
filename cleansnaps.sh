#!/bin/bash
# from: https://superuser.com/questions/1310825/how-to-remove-old-version-of-installed-snaps
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
echo "snap size before:"
sudo du -h /var/lib/snapd/snaps
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
echo "snap size after:"
sudo du -h /var/lib/snapd/snaps
