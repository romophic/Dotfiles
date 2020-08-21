#!/bin/bash
ip -o addr | grep "192" | cut -d\  -f 7 | cut -d/ -f 1
