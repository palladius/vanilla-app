var express = require('express');
var router = express.Router();

//https://melvingeorge.me/blog/get-all-the-contents-from-file-as-string-nodejs
const fs = require("fs");
const version_buffer = fs.readFileSync("VERSION");

//require('dotenv').config();
var dotenv = require('dotenv')
var dotenvExpand = require('dotenv-expand');
const { hostname } = require('os');
var dotenvConfig = require('dotenv').config();

const app_name =  '☕ Express0'
const deploy_target= process.env.DEPLOY_TARGET

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
    // JAVA: InetAddress.getLocalHost().getHostName()
//, //     location.hostname,
  });
});

router.get('/statusz', function(req, res, next) {
  res.render('statusz', {
    title: 'Simple Expresso App',
    app_name: app_name,
    deploy_target: process.env.DEPLOY_TARGET,
    app_version: version_buffer,
    node_env: process.env.NODE_ENV,
  });
});

/* GET users listing. */
router.get('/users', function(req, res, next) {
  const statusz = `app_name=${app_name} app_version=${version_buffer} node_env=${process.env.NODE_ENV} deploy_target=${deploy_target}`
  res.send(statusz);
//  res.send('respond with a resource');
});

module.exports = router;