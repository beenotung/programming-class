/**
 * Created by node on 5/16/16.
 */
var cache = [];
function fib(n) {
    if (cache[n])
        return cache[n];
    var value;
    if (n == 1 || n == 2)
        value = 1;
    else
        value = fib(n - 1) + fib(n - 2);
    cache[n] = value;
    return value;
}
console.log(fib(1e10));

