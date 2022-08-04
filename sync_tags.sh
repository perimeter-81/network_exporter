#!/bin/bash
git fetch upstream
git remote add upstream https://github.com/syepes/network_exporter
git fetch upstream
git rebase upstream/master
git push
git push --tags