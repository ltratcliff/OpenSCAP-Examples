#!/bin/bash
# Documentation here: https://redhatgov.io/workshops/rhel_8/exercise1.7/
oscap xccdf eval --fetch-remote-resources --profile xccdf_org.ssgproject.content_profile_stig --results-arf /tmp/arf.xml --report /tmp/report.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
