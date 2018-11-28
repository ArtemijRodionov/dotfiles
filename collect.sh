#!/usr/bin/env bash

# Collect dotfiles to src/ directory

find src -type f | sed 's/src\///' | xargs -I {} cp ~/{} src/{}

