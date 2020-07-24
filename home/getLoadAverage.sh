#!/bin/sh

uptime | sed -E 's/.*load average: ([0-9]\.[0-9][0-9]).*/\1/g'
