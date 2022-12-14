
MAKEFILE_REPO = us-central1-docker.pkg.dev/cicd-platinum-test031/my-skaffold-cornucopia/sku-vanilla-app-image

install:
# this doesnt work: creates opackage-lock.json HERE :)
#make -C app/ install
	cd app && make install
run:
	echo Running in debug mode
	cd app && make run

verify:
	kubectl get all | grep vanilla-app

skaffold-deploy:
	skaffold build
	skaffold render > tmp/tmp.yaml
	kubectl apply -f tmp/
	rm tmp/tmp.yaml

# new multi-situation DEV/PROD with SK+KU
skaffold-dev-in-dev:
	skaffold dev -p dev
skaffold-dev-in-prod:
	skaffold dev -p prod
skaffold-dev-in-cloudrun:
# kubectl repo is useless for Cloud Run, but its set with a certain build repo. :)
#SKAFFOLD_DEFAULT_REPO='gke_cicd-platinum-test031_us-central1_cicd-dev'
	skaffold dev -p wietse --default-repo $(MAKEFILE_REPO)
# 'us-central1-docker.pkg.dev/cicd-platinum-test031/my-skaffold-cornucopia/sku-vanilla-app-image'
#skaffold dev -p cloudrun

skaffold-render-diff:
	skaffold render -p prod | tee t.prod
	skaffold render -p dev  | tee t.dev
	diff t.prod t.dev

skaffold-config:
	kubectl config current-context
	kubectl config get-contexts
	skaffold config list --all
	echo ✓ DONE. 💾

push-to-cloudrun:
	skaffold run -p wietse

kubectl-get-all:
	kubectl get all | grep 'vanilla'

skaffold-deploy-to-cloudrun:
	skaffold run -p wietse --tail
deploy-to-cloudrun: skaffold-deploy-to-cloudrun

skaffold-deploy-to-prod:
#	skaffold run -p prod --default-repo $(MAKEFILE_REPO)
	./skaffold-prod-wrapper.sh run
deploy-to-prod: skaffold-deploy-to-prod

cloud-deploy-setup:
	bin/setup-cloud-deploy.sh

kind-create-clusters:
	kind create cluster -n ricc-dev
	kind create cluster -n ricc-prod
	kubectl cluster-info --context kind-ricc-dev
	kubectl cluster-info --context kind-ricc-prod


# simpler:
dev: skaffold-dev-in-dev
prod: skaffold-deploy-to-prod
