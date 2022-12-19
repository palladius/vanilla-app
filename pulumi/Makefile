

up:
#	pulumi select stack dev
#
	echo 'First time do: gcloud auth application-default login'
	pulumi up --yes --stack dev


down:
	pulumi destroy


up-prod:
	echo 'For prod I wait for an ACK from you 😉'
	pulumi up --stack dev
