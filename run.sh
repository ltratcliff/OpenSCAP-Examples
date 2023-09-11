#!/bin/bash
#wget -O - https://www.redhat.com/security/data/oval/v2/RHEL8/rhel-8.oval.xml.bz2 | bzip2 --decompress > rhel-8.oval.xml
oscap oval eval --report vulnerability.html rhel-8.oval.xml
