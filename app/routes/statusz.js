var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/statusz', function(req, res, next) {
  res.render('statusz', { title: 'Simple Expresso App', appname: '☕ Express0' });
});

module.exports = router;
