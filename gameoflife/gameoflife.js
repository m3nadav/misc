let _ = require('lodash');
let seed = [[1, 1], [1, 2], [2, 1], [4, 3], [4, 4], [3, 4]];
const size = 6;



function getVecinos(allLiving) {
	let neighbours = {};
	allLiving.map(function ([x1,y1]) {
		for (let rowMod=-1;rowMod<=1;rowMod++) {
			for (let colMod=-1;colMod<=1;colMod++) {
				if ( colMod !== 0 || rowMod !== 0) {
					let point = `${x1+rowMod},${y1+colMod}`;
					if (!neighbours[point]) {
						neighbours[point] = 0;
					}
					neighbours[point]++;
				}
			}
		}
	});
	return neighbours;
}

function populateVecinos(state) {
	let veciBoard = [];
	for (let i=0;i<size;i++) {
		veciBoard[i] = [];	
		for (let j=0;j<size;j++) {
			veciBoard[i][j] = 0;
		}
	}
	let neighbours = getVecinos(state);
	_.map(neighbours, function (neighbour,key) {
		let [x, y] = key.split(',');
		veciBoard[parseInt(x)][parseInt(y)] = neighbour;
	});
	return veciBoard;
}

function populateBoard(state) {
	let tempBoard = [];
	for (let i=0;i<size;i++) {
		tempBoard[i] = [];
		for (let j=0;j<size;j++) {
			let stateCheck = state.filter(x => x.join('')==[i,j].join(''));
			tempBoard[i][j] = stateCheck.length>0;
		}
	}
	return tempBoard;
}

function drawBoard(state) {
	let board = populateBoard(state);
	let curStr = ``;
  for (let i=0;i<size;i++) {
    for (let j=0;j<size;j++) {
      curStr += board[i][j] ? `*` : ` `;
    }
    curStr += `
    `;
  }
  console.log(curStr);
	
}

function decideState(state) {
	let vecinos = populateVecinos(state);
	let board = populateBoard(state);
	let newState = [];
  for (let i=0;i<size;i++) {
    for (let j=0;j<size;j++) {
			if (board[i][j]) {
				if (vecinos[i][j] >= 2 && vecinos[i][j] <=3) {
					newState.push([i,j]);
				}						
			} else {
				if (vecinos[i][j] === 3) {
					newState.push([i,j]);
				}
			}			
		}
	}
	return newState;
}

function* nextGeneration(seed) {
	let generatedState = seed;
	while (true) {
		yield generatedState;
		generatedState = decideState(generatedState);
	}
}

//drawBoard(seed);
let gen = nextGeneration(seed);
for (let i=0; i<10; i++) {
	drawBoard(gen.next().value);
}
