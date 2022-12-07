# https://stackoverflow.com/questions/13034496/using-global-variables-between-files
'''Here I set up common configs.

'''

from cProfile import run
from pip import main
import pulumi
import pulumi_gcp as gcp
#import pulumi_synced_folder as synced


def init():
    global config
    global stack
    global region
    global project_id

    print('[lib.settings] 🧹 init() called')
    # if CONFIG is not None:
    #     return
    #global myList
    #myList = []
    gcp_config = pulumi.Config('gcp')
    config = pulumi.Config()
    stack = pulumi.get_stack()
    region = gcp_config.get("region", "us-central1")
    project_id = gcp_config.get("project", "my-default-project-id")
    #print('[lib.settings] 🧹 init() called')


