#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {}
}

pub fn is_prime(n: i32) -> bool {
    for x in 2..n / 2 + 1 {
        if n % x == 0 {
            return false
        }
    }
    return true
}