#!/bin/bash

VER="1.1_2022"

direnv allow .

# Pleonastic now that I found the bug :)
#export SKAFFOLD_DEFAULT_REPO="$SKAFFOLD_DEFAULT_REPO_FOR_PROD"

# TODO remove echodo
(
echo "# $0: a wrapper with SkDfltRepo and DEV profile (-p prod)."
echo "# 👷 SKAFFOLD_DEFAULT_REPO=$SKAFFOLD_DEFAULT_REPO "
echo "# 👷 Current context:      $(kubectl config current-context)"
)>&2

#echodo
skaffold -p prod "$@" # --default-repo "$SKAFFOLD_DEFAULT_REPO"
