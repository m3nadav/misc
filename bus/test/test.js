var chai = require('chai');
var expect = chai.expect;
var request = require('request');
chai.use(require('chai-things'));

describe("Bus Calculator General Tests", function () {

  it("GET request to /bus", function () {
  	request('http://localhost:3300/bus', function (error, response, body) {
	 	  expect(response.statusCode).to.eql(200);
		});
  });

	it("GET request to /bus/30", function () {
		request('http://localhost:3300/bus/30', function (error, response, body) {
			expect(body).to.contain('drive code');
			expect(response.statusCode).to.eql(200);
		});
	});

	it("GET request to /bus/50", function () {
		request('http://localhost:3300/bus/50', function (error, response, body) {
			expect(body).to.contain('drive code');
			expect(response.statusCode).to.eql(200);
		});
	});

	it("GET request to /bus/100", function () {
		request('http://localhost:3300/bus/100', function (error, response, body) {
			expect(response.statusCode).to.eql(200);
			expect(body).to.contain('adrive code');
		});
	});

  it("GET request to /bus/100/42", function () {
    request('http://localhost:3300/bus/100/42', function (error, response, body) {
      expect(response.statusCode).to.eql(200);
      expect(body).to.contain('adrive code');
    });
  });

  it("GET request to /bus/100/43", function () {
    request('http://localhost:3300/bus/100/43', function (error, response, body) {
      expect(response.statusCode).to.eql(200);
      expect(body).to.contain('adrive code');
    });
  });

  it("GET request to /bus/100/44", function () {
    request('http://localhost:3300/bus/100/44', function (error, response, body) {
      expect(response.statusCode).to.eql(200);
      expect(body).to.contain('adrive code');
    });
  });
});
