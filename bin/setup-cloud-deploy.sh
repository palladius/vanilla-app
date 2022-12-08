#!/bin/bash


# location: projects/MY_PROJECT_ID/locations/MY_REGION
#direnv allow .

source .envrc || exit 42

cat clouddeploy.template.yaml |
    sed -e 's/MY_PROJECT_ID/'$PROJECT_ID'/g' |
    sed -e 's/MY_REGION/'$GOOGLE_REGION'/g' |
    sed -e 's/MY_DATETIME/'`date +%Y%m%d-%H%M%S`'/g' \
    > tmp/clouddeploy.yaml


gcloud beta deploy apply --file=tmp/clouddeploy.yaml \
                         --region=$GOOGLE_REGION \
                         --project=$PROJECT_ID

# gcloud beta deploy releases create test-release-001 \
#   --project=$PROJECT_ID \
#   --region=$GOOGLE_REGION \
#   --delivery-pipeline=vanilla-app \
#   --images=app=<repo>:<tag_to_deploy>
