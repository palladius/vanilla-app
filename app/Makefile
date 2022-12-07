OCCASIONAL_MESSAGE = "Let's see if it 🍄 funges (Italian for 'works').\
            This is something I tested just 30m ago in VanillaApp.<br/>\
            Something i learnt is that ACCESS to this is not regulated from this YAML\
            but instead from the IAM permission you give to the runner (or sth similar)."

install:
	npm install
	npm i dotenv
	npm i sass
	npm i dotenv-expand

run:
	npm run scss-riccardo-once
	DEBUG=myapp:* OCCASIONAL_MESSAGE=$(OCCASIONAL_MESSAGE) DEPLOY_TARGET='Makefile' SPEAKER_NAME='Riccardo MacFile' LAUNCHING_HOSTNAME=`hostname` npm start
