

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
	kaffold dev -p dev
skaffold-dev-in-prod:
	kaffold dev -p prod
skaffold-render-diff:
	skaffold render -p prod | tee t.prod
	skaffold render -p dev  | tee t.dev
	diff t.prod t.dev

