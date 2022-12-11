#!/bin/bash

# TODO check if fatal exists for everyone
source .envrc ||
    fatal 'Cant do it'

# ONCE: gcloud container clusters get-credentials cicd-dev --region us-central1 --project cicd-platinum-test031
# gcloud container clusters get-credentials cicd-prod --region us-central1 --project cicd-platinum-test031
#kubectl get all | grep vanilla

echo 1. DEV
echodo kubectl --context="$KUBECTONTEXT_FOR_DEV" get all | prepend "|DEV| " | grep vanilla


echo 2. PROD
echodo kubectl --context="$KUBECTONTEXT_FOR_PROD" get all | prepend "|PROD| " | grep vanilla
