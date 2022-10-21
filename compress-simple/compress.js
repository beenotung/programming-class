let input = [0, 1, 1, 1, 2, 2, 3, 4, 5, 5, 1, 1]
let answer = [0, [3, 1], [2, 2], 3, 4, [2, 5], [2, 1]]

function compress(input) {
  if (input.length == 0) {
    return input
  }
  let res = []
  let buffer = [1, input[0]]
  for (let i = 1; i < input.length; i++) {
    let value = input[i]
    if (value == buffer[1]) {
      buffer[0]++
    } else {
      if (buffer[0] == 1) {
        res.push(buffer[1])
      } else {
        res.push(buffer)
      }
      buffer = [1, value]
    }
  }
  if (buffer[0] == 1) {
    res.push(buffer[1])
  } else {
    res.push(buffer)
  }
  return res
}

console.log('input', input)
console.log('answer', answer)
console.log('output', compress(input))
