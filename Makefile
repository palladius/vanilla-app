

run:
	echo Running in debug mode
	cd app && make run

verify:
	kubectl get all | grep vanilla-app
