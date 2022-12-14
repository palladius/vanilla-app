#!/usr/bin/env ruby


# copied from https://skaffold.dev/docs/pipeline-stages/lifecycle-hooks/
INTERESTING_ENVS = %w{
    SKAFFOLD_IMAGE
    SKAFFOLD_PUSH_IMAGE
    SKAFFOLD_IMAGE_REPO
    SKAFFOLD_IMAGE_TAG
    SKAFFOLD_BUILD_CONTEXT
    SKAFFOLD_FILES_ADDED_OR_MODIFIED
    SKAFFOLD_FILES_DELETED
    SKAFFOLD_RUN_ID
    SKAFFOLD_DEFAULT_REPO
    SKAFFOLD_RPC_PORT
    SKAFFOLD_HTTP_PORT
    SKAFFOLD_KUBE_CONTEXT
    SKAFFOLD_MULTI_LEVEL_REPO
    SKAFFOLD_NAMESPACES
    SKAFFOLD_WORK_DIR

    HOSTNAME
    USER
}

INTERESTING_ENVS.each do |env_key|
    puts "🟡 #{env_key} -> #{ENV.fetch env_key, '🎚️'}"
end
