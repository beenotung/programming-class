mod lib;

use lib::is_prime;

fn main() {
    let args: Vec<_> = std::env::args().collect();
    if args.len() < 2 {
        println!("Usage: cargo run <offset> [count=1]");
        return;
    }
    let mut acc: i32 = args[1].parse().unwrap();
    let n = if args.len() == 3 {
        args[2].parse().unwrap()
    } else {
        1
    };
    println!("finding from offset {}", acc);

    let mut count = 0;
    while count < n {
        acc += 1;
        if is_prime(acc) {
            count += 1;
            println!("next {} prime is {}", count, acc);
            if count >= n {
                break
            }
        }
    }
}