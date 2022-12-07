# VanillaApp Pulumization v${outputs.app_version}

Pasta Pulumization version: v**${outputs.pastang_ricc_version}**
This contains a lot of interesting info from..

* hashTest: **${outputs.hashTest}**.
* hashTest Deeper: **${outputs.hashTest.Author}**. Funge! 🍄

## GCP Resources

🌃 **GKE**:

* 🌃 GKE cluster link: ${outputs.native_gke_cluster_link}


🔋 **GCS**:

* classic_bucket: **${outputs.classic_bucket_name}**. [CloudConsoleURL](https://console.cloud.google.com/storage/browser/${outputs.classic_bucket_name}):
* classic_bucket: ${outputs.classic_bucket_link} (useless)

🏃 **Cloud Run**:

* **Final Destination URL**: **${outputs.classic_run_service_url}**
* **Magic** Revisions Cloud Run page (**λ**): ${outputs.classic_run_service_magic_cconsole_url}
* Less relevant:
    * classic_run_service_id: `${outputs.classic_run_service_id}`
    * classic_run_service_statuses: *${outputs.classic_run_service_statuses}*

🍝 🔋 **Artifact Repo** and 🖼️ **Images**:

* 🍝 🔋 link: **${outputs.pasta_ar_existing_repo}**
* 🍝 🖼️ img: **${outputs.ultimate_pasta_image}**

## Notes

* to add new dependencies in python, do: `venv/bin/pip install -r requirements.txt` as per [Docs](https://www.pulumi.com/docs/intro/languages/python/).

## Changelog

```bash
${outputs.app_changelog}
```
