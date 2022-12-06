//require('dotenv').config();
var dotenv = require('dotenv')
var dotenvExpand = require('dotenv-expand')

var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

//var appname = '☕ Expresso'
var indexRouter = require('./routes/index');
// var usersRouter = require('./routes/statusz');
// var statusRouter = require('./routes/status');

var app = express();

app.use(express.static('public'));
app.use(express.static(__dirname + '/public'));
// Assets Riccardo found here https://dev.to/elvelive/setting-up-sass-in-an-express-app-jk4
app.use('/assets', express.static(path.join(__dirname, '../public')))

// ERROR: i = document.querySelector('.bubble');
//var tools = require('./public/js/bubble.js');


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
