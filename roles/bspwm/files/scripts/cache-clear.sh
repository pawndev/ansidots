#!/bin/bash

docker image prune
docker volume prune
paru -Scc
yarn cache clean
npm cache clean --force
pnpm store prune
docker builder prune
