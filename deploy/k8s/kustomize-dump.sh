#!/bin/bash



set -e

echo '1. Kustomize rendering START.'

kustomize build overlays/dev/   > tmp-dev.yaml
kustomize build overlays/prod/  > tmp-prod.yaml

echo '2. Kustomize rendering DONE. Lets see diff now:'

diff  tmp-dev.yaml tmp-prod.yaml | lolcat

echo '3. DONE.'
