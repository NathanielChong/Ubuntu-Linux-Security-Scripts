#!/bin/bash

ps aux | grep nc >> aux.txt
lsof | grep LISTEn >> lsof.txt

declare -a potList=();
