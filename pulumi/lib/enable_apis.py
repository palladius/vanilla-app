import pulumi_gcp as gcp


APIS_TO_BE_ENABLED = [
    'artifactregistry',
    'iam', #uhm seems wrong..
    'cloudbuild',
    'clouddeploy',
    'run',
]

for api_name in APIS_TO_BE_ENABLED:
    print("Enabling API for {}".format(api_name)) # 📛
    _ = gcp.projects.Service(
        "enable-api-{}".format(api_name),
        disable_dependent_services=True,
        #project="your-project-id",
        service="{}.googleapis.com".format(api_name))


#project2 =
# gcp.projects.Service(
#         "enable-api-blah",
#         disable_dependent_services=True,
#         #project="your-project-id",
#         service="blah.googleapis.com")
