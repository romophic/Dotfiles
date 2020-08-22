#!/bin/bash
ip addr | grep "192" | awk '{print $2}'
