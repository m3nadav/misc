#!/bin/bash
pkill nodejs
git pull && nodejs bus.js &
