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

/* GET home page. */
router.get('/', function(req, res, next) {
  require('os');
  res.render('index', {
    title: 'Simple ☕ Express0 App',
    app_name: '☕ Express0',
    dotenv: dotenv,
    app_version: version_buffer,
    node_env: process.env.NODE_ENV,
    hostname: require('os').hostname(),
    // JAVA: InetAddress.getLocalHost().getHostName()
//, //     location.hostname,
  });
});

module.exports = router;
