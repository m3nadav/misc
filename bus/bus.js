var express = require('express');
var calc = require('./calc.js');
var app = express();

function processGet(req, res) {
	res.header({'Content-type': 'application/json'});
  var loopCount = req.params.loopCount || 1;
  res.status(200).send(calc(req.params.contract, req.params.driveCode, loopCount));
}

app.get('/bus', function (req,res) {
	res.header({'Content-type': 'text/html'});
	res.write('Choose contract loading by ILS<br>');
  res.write('<a href="/bus/30">30 ILS</a><br>');
  res.write('<a href="/bus/50">50 ILS</a><br>');
  res.status(200).end('<a href="/bus/100">100 ILS</a>');
});
app.get('/bus/:contract', function (req, res) {
	res.header({'Content-type': 'text/html'});
	res.write('Choose the drive code you use<br>');
  res.write('<a href="/bus/'+req.params.contract+'/42">42 - intown (6.90 ILS)</a><br>');
  res.write('<a href="/bus/'+req.params.contract+'/43">43 - between towns (10.50 ILS)</a><br>');
  res.end('<a href="/bus/'+req.params.contract+'/44">44 - between towns (10.90 ILS)</a>');
});
app.get('/bus/:contract/:driveCode', function (req, res) {
	processGet(req, res);
});
app.get('/bus/:contract/:driveCode/:loopCount', function (req, res) {
	processGet(req, res);
});

app.listen(3300);
