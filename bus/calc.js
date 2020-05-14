var math = require('math');
function calc(contract, driveCode, loopCount) {
  var driveCodesDict = {
    '42': 6.9,
    '43': 10.5,
    '44': 10.9
  };
  var load = {count:0, sum:0, interval:contract*1.25};
  var ticket = {count:0, sum:0, cost:driveCodesDict[driveCode]};
  var results = {
    min_spare:6.9,
    load: {
      count_loads:0,
      total_loaded:0},
    use: {
      count_uses:0,
      total_used:0
    }
  };
  var loops = 100*(loopCount || 1);


  function loader() {
    load.sum += load.interval;
    load.count++;
  }

  function user() {
    ticket.count++;
    ticket.sum += ticket.cost;
    load.sum -= ticket.cost;
    load.sum = math.round(load.sum*100)/100;
    if (load.sum < results.min_spare) {
      results.min_spare = load.sum;
      results.load.count_loads = load.count;
      results.use.count_uses = ticket.count;
    }
  }

  for (var i=0; i<loops;i++) {
    if (load.sum > ticket.cost) {
      user();
    } else {
      loader();
    }
  }
  results.load.total_loaded = results.load.count_loads * load.interval;
  results.use.total_used = results.use.count_uses * ticket.cost;
  return results;
}

module.exports = calc;
