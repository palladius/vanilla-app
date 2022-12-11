#!/bin/bash

VER="1.1b_2022"

direnv allow .

(
echo "# $0 v$VER: a wrapper with SkDfltRepo and DEV profile (-p dev)."
echo "# 👷 SKAFFOLD_DEFAULT_REPO=$SKAFFOLD_DEFAULT_REPO "
echo "# 👷 Current context(*):      $(kubectl config current-context)"
echo "# 👷 (*): Skaffold could still set it dirrently. Dont be sad just bcs its different from skaffold.yaml"
)>&2

skaffold -p dev "$@" # --default-repo "$SKAFFOLD_DEFAULT_REPO"
