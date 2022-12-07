import pulumi
import pulumi_gcp as gcp
#import settings

# create AR my-skaffold-cornucopia
# config arName

config = pulumi.Config()
gcp_config = pulumi.Config('gcp')
ar_name = config.get("arName", "default-artifact-reponame")

my_repo = gcp.artifactregistry.Repository(
    "skaffold-repo",
    ar_name,
    description="pulumi created docker repository",
    format="DOCKER",
    location=gcp_config.get("region", "us-central1"),
    repository_id=ar_name)

