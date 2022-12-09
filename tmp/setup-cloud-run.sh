#!/bin/bash

# inspired by Christoph: https://medium.com/google-cloud/deploy-to-cloud-run-from-cloud-deploy-4f83628cf045

set -e

source .env

proceed_if_error_matches 'already exists' \
    gcloud iam service-accounts create ricc-skaffold-runner --project $GOOGLE_CLOUD_PROJECT
proceed_if_error_matches 'already exists' \
    gcloud iam service-accounts create ricc-skaffold-deployer --project $GOOGLE_CLOUD_PROJECT

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
    --member=serviceAccount:ricc-skaffold-deployer@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com \
    --role="roles/clouddeploy.jobRunner"

# Allow the deployer SA to create Cloud Run services
gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
    --member=serviceAccount:ricc-skaffold-deployer@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com \
    --role="roles/run.developer"
# Allow the deployer service account to impersonate the Runner SA
gcloud iam service-accounts add-iam-policy-binding ricc-skaffold-runner@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com \
    --role roles/iam.serviceAccountUser \
    --member "serviceAccount:ricc-skaffold-deployer@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com" \
    --project $GOOGLE_CLOUD_PROJECT


#### public service on the internet
# https://cloud.google.com/run/docs/securing/managing-access?_ga=2.206668115.-1565668195.1646577657
# gcloud run services add-iam-policy-binding [SERVICE_NAME] \
#     --member="allUsers" \
#     --role="roles/run.invoker"
# gcloud run deploy [SERVICE_NAME] ... --allow-unauthenticated
