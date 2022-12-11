#!/bin/bash

VER="1.1b_2022"

direnv allow .

(
echo "# $0  v$VER: a wrapper with SkDfltRepo and PROD profile (-p prod)."
echo "# 👷 SKAFFOLD_DEFAULT_REPO=$SKAFFOLD_DEFAULT_REPO "
echo "# 👷 Current context:      $(kubectl config current-context)"
)>&2

skaffold -p prod "$@" # --default-repo "$SKAFFOLD_DEFAULT_REPO"
