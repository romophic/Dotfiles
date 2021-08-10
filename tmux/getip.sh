#!/bin/bash
hostname -I | awk '{print substr($0, 1, length($0)-1)}'
