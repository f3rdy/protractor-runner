#!/bin/bash -x

uid=$(stat -c %u ${PWD})
gid=$(stat -c %g ${PWD})

groupadd -o -g $gid protractor
useradd -m -s /bin/bash -o -u $uid -g $gid protractor

Xvfb :97 -ac &
export DISPLAY=:97

webdriver-manager update && \
webdriver-manager start --ignore_ssl --verbose &> /tmp/webdriver.log &

sudo -u protractor bash
