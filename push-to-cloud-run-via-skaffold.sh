

# 1. who is Wietse? My friend who knows Cloud run.
# 2. What does skaffold run mean? https://skaffold.dev/docs/references/cli/

# 3. IMPORT NOTE: ENV var comes from .envrc via "direnv allow ."
echo "Building image in $SKAFFOLD_DEFAULT_REPO_FOR_CLOUDRUN and then Deploying to Cloud Run :)"
skaffold run -p wietse --default-repo $SKAFFOLD_DEFAULT_REPO_FOR_CLOUDRUN

# making it PUBLICLY available. too beautiful to stay secret here!
gcloud run services add-iam-policy-binding sku-vanilla-app \
    --region "$SKAFFOLD_CLOUD_REGION" \
    --member="allUsers" \
    --role="roles/run.invoker"
