from cProfile import run
from pip import main
import pulumi
import pulumi_gcp as gcp
import pulumi_synced_folder as synced


# TODO remove this
#import lib.boileplate_code


# Import the program's configuration settings.
config = pulumi.Config()

pulumi.export('vanillaapp_ricc_version', open("../VERSION", "r").read().strip())
pulumi.export('vanillaapp_ricc_version', open("../VERSION", "r").read().strip())
with open('./Pulumi.README.md') as f:
    pulumi.export('readme', f.read())
