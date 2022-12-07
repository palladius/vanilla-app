import settings
import pulumi
import pulumi_gcp as gcp

settings.init()

# TODO remove this
#import lib.boileplate_code
import lib.enable_apis
#import lib.artifact_repo

# Import the program's configuration settings.


gkeCluster = settings.config.get("existingGkeCluster", "my-{}-cluster".format(settings.stack)) # dev for dev

#pulumi.export('vanillaapp_ricc_version', open("../VERSION", "r").read().strip())
pulumi.export('app_version', open("../VERSION", "r").read().strip())
pulumi.export('app_changelog', open("../CHANGELOG.md", "r").read().strip())

with open('./Pulumi.README.md') as f:
    pulumi.export('readme', f.read())

pulumi.export("hashTest", {'num': 42, 'Author': 'Doug'})
