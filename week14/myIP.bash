#!/bin/bash

ip addr \
	| grep -oE 'inet [0-9.]+' \
	| grep -v 'inet 127\.' \
	| cut -d' ' -f2
