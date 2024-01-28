#!/usr/bin/env bash

find src -type f | sed 's/src\///' | xargs -I {} cp ~/{} src/{}

