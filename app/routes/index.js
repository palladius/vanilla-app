var express = require('express');
var router = express.Router();

//require('dotenv').config();
var dotenv = require('dotenv')
var dotenvExpand = require('dotenv-expand')
var dotenvConfig = require('dotenv').config();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', {
    title: 'Simple Expresso App',
    appname: '☕ Express0',
    dotenv: dotenv,
  });
});

module.exports = router;
