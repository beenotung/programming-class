let input = [0,1, 1, 1, 2, 2, 3, 4, 5, 5, 1, 1];
let answer = [0,[3, 1], [2, 2], 3, 4, [2, 5], [2, 1]];

function compress(input) {
    let res = [];
    let isFirst = true;
    let last;
    let current;
    let count = 0;
    for (let i = 0; i < input.length; i++) {
        current = input[i];
        if (current == last || isFirst) {
            count++;
        } else {
            if (count == 0) {
                res.push(current);
            } else {
                res.push([count, last]);
                count = 0;
            }
        }
        isFirst = false;
        last = current;
    }
    if (count == 0) {
        res.push(current);
    } else {
        res.push([count, current]);
        count = 0;
    }
    return res;
}

console.log('input', input);
console.log('answer', answer);
console.log('output', compress(input));