# OCCASIONAL_MESSAGE = "Let's see if it 🍄 funges (Italian for 'works').\
#             This is something I tested just 30m ago in VanillaApp.<br/>\
#             Something i learnt is that ACCESS to this is not regulated from this YAML\
#             but instead from the IAM permission you give to the runner (or sth similar)."
OCCASIONAL_MESSAGE = "Make your dream happen.<br/><br/> \
		Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
		Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer \
		took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\
		but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the\
		1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop\
		publishing software like Aldus PageMaker including versions of Lorem Ipsum"
install:
	npm install
	npm i dotenv
	npm i sass
	npm i dotenv-expand

run:
	npm run scss-riccardo-once
	DEBUG=myapp:* OCCASIONAL_MESSAGE=$(OCCASIONAL_MESSAGE) DEPLOY_TARGET='Makefile' SPEAKER_NAME='Riccardo MacFile' LAUNCHING_HOSTNAME=`hostname` npm start
