/**
* Dynamic Programming Approach
*/
function printInputText() {
  process.stdout.write("input a seed: ");
}
const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});
const primes = [2, 3];
function lastPrime () {
  return primes[primes.length-1];
}
function findNextPrime() {
  let i = lastPrime();
  i:
  for(;;) {
    i+=2;
    //console.log("i=", i);
    for(let p of primes) {
      if (i%p == 0) {
        //console.log("i%p => ", i, "%", p, "=", i%p);
        continue i;
      }
    }
    //console.log("passed", i);
    primes.push(i);
    return i;
  }
}
function binarySearch(xs, x) {
  let l = 0;
  let r = xs.length - 1;
  for(;l<=r;) {
    let m = Math.floor((r+l)/2);
    //console.log({
    //  x: x
    //  , l: l
    //  , r: r
    //  , m: m
    //  , v: xs[m]
    //});
    if ( xs[m] == x ) {
      return m;
    }
    if ( xs[m] > x ) {
      r = m-1;
    } else {
      l = m+1;
    }
  }
  return l;
}
function nextPrime (acc) {
  acc++; 
  if (primes.indexOf(acc) != -1) {
    //console.log("from cache");
    return acc;
  }
  if (lastPrime()>acc) {
    //console.log("do binarySearch...");
    const idx = binarySearch(primes, acc);
    //console.log("found index=", idx);
    //console.log(primes[idx-1], primes[idx], primes[idx+1]);
    return primes[idx];
  }
  for(;;) {
    let next = findNextPrime();
    //console.log("next=", next);
    if (next>acc) {
      return next;
    }
  }
}
rl.on("line", line => {
  if (+line < 1) {
    console.log("next be larger than zero");
  } else {
    console.log("next prime: ", nextPrime(+line));
  }
  printInputText();
});
printInputText();
