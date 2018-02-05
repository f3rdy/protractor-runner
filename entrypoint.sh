#!/bin/bash

uid=$(stat -c %u ${PWD})
gid=$(stat -c %g ${PWD})

groupadd -o -g $gid protractor
useradd -m -o -u $uid -g $gid protractor

Xvfb :97 -ac &
export DISPLAY=:97

sudo -u protractor bash $@
