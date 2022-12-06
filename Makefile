
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
	skaffold dev -p wietse

skaffold-render-diff:
	skaffold render -p prod | tee t.prod
	skaffold render -p dev  | tee t.dev
	diff t.prod t.dev

skaffold-config:
	kubectl config current-context
	kubectl config get-contexts
	skaffold config list --all

push-to-cloudrun:
	skaffold deploy -p wietse
