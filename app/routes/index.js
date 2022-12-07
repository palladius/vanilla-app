var express = require('express');
var router = express.Router();

//https://melvingeorge.me/blog/get-all-the-contents-from-file-as-string-nodejs
const fs = require("fs");
const version_buffer = fs.readFileSync("VERSION");
const bubblejs_filecontent = fs.readFileSync("public/js/bubble.js");

//require('dotenv').config();
var dotenv = require('dotenv')
var dotenvExpand = require('dotenv-expand');
const { hostname } = require('os');
var dotenvConfig = require('dotenv').config();

const app_name =  '☕ Express0'
const deploy_target= process.env.DEPLOY_TARGET

const listOfEnvVars = [
  "OCCASIONAL_MESSAGE", "DEPLOY_TARGET", "TEST_DB_PASS",
  "HOSTNAME", "LAUNCHING_HOSTNAME", "LONGHOSTNAME_MANHOUSE",
  "NODE_ENV",
  "USER", "PORT", "MY_SECRET_KEY",
  'CLOUDSDK_CORE_PROJECT', // comed from .envrc
  //'EDITOR','GOOGLE_KEY',
]

// I manually patch the ENV[] at 'manhouse'
process.env.LONGHOSTNAME_MANHOUSE = require('os').hostname()
process.env.HOSTNAME = process.env.LONGHOSTNAME_MANHOUSE.split('.')[0]



/* GET home page. */
router.get('/', function(req, res, next) {
  require('os');
  res.render('index', {
    title: 'Simple ☕ Express0 App',
    app_name: app_name,
    dotenv: dotenv,
    app_version: version_buffer,
    node_env: process.env.NODE_ENV,
    deploy_target: process.env.DEPLOY_TARGET,
    hostname: require('os').hostname(),
    listOfEnvVars: listOfEnvVars,
    occasional_message: process.env.OCCASIONAL_MESSAGE || '😞_MISSING_OCCASIONAL_MESSAGE_😞',
    speaker_name: process.env.SPEAKER_NAME  || 'Riccardo', // or Riccardo
    bubble_image_src: process.env.BUBBLE_IMAGE_SRC || './images/ricc-says-indonesia.jpg',
    bubblejs_filecontent: bubblejs_filecontent,
    // JAVA: InetAddress.getLocalHost().getHostName()
//, //     location.hostname,
  });
});

router.get('/status', function(req, res, next) {
  res.render('status', {
    title: 'Simple Expresso App',
    app_name: app_name,
    deploy_target: process.env.DEPLOY_TARGET,
    app_version: version_buffer,
    node_env: process.env.NODE_ENV,
  });
});

/* GET short STATUSZ listing. */
router.get('/statusz', function(req, res, next) {
  const statusz = `app_name=${app_name} app_version=${version_buffer} node_env=${process.env.NODE_ENV} deploy_target=${deploy_target}`
  res.send(statusz);
//  res.send('respond with a resource');
});

router.get('/bubble', function(req, res, next) {
  res.render('bubble', {
    title: 'Sample bubble page',
    app_name: app_name,
    deploy_target: process.env.DEPLOY_TARGET,
    app_version: version_buffer,
    node_env: process.env.NODE_ENV,
    occasional_message: process.env.OCCASIONAL_MESSAGE || '😞_MISSING_OCCASIONAL_MESSAGE_😞',
    speaker_name: process.env.SPEAKER_NAME  || 'Riccardo', // or Riccardo
    bubble_image_src: process.env.BUBBLE_IMAGE_SRC || './images/ricc-says-indonesia.jpg',
    bubblejs_filecontent: bubblejs_filecontent,
  });
});



module.exports = router;
