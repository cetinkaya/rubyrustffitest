#[no_mangle]
pub extern fn fact(x: u64) -> u64 {
    if x <= 1 {
        1
    } else {
        x * fact(x - 1)
    }
}
