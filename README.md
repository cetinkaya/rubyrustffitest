# rubyrustffitest
Test for using ffi in ruby for calling a function from a dynamic library created with rust.

We have a rust function to calculate factorial in fact.rs:

```rust
#[no_mangle]
pub extern fn fact(x: u64) -> u64 {
    if x <= 1 {
        1
    } else {
        x * fact(x - 1)
    }
}
```

We create libfact.so with

```sh
rustc --crate-type=dylib fact.rs 
```

Now in ruby, using ffi gem we attach the fact function to a module named Fact and calculate fact(10): 

```ruby
require "ffi"

module Fact
  extend FFI::Library
  ffi_lib "./libfact.so"
  attach_function(:fact, [:int], :int)
end

puts "10! is #{Fact.fact(10)}"
```
