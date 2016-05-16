/**
 * Created by node on 5/16/16.
 */
function isPrime(n) {
    for (var i = 2; i <= n - 1; i++) {
        if (n % i == 0) {
            console.log('dividable by', i);
            return false;
        }
    }
    return true;
}
console.log(isPrime(123));