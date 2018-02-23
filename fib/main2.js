var a, b, t;
var c, d;
for (a = 1, b = 1, t = 0; t < 100; t++) {
    c = b;
    d = a + b;
    a = c;
    b = d;
}
console.log(a);
