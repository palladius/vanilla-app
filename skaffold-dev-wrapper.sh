#!/bin/bash

direnv allow .

export SKAFFOLD_DEFAULT_REPO="$SKAFFOLD_DEFAULT_REPO_FOR_DEV"

# TODO remove echodo
echo "# Selecting DEV repo: $SKAFFOLD_DEFAULT_REPO and DEV profile (-p dev). Current context: " >&2
kubectl config current-context  >&2

echodo skaffold -p dev "$@"
