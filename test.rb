require "ffi"

module Fact
  extend FFI::Library
  ffi_lib "./libfact.so"
  attach_function(:fact, [:int], :int)
end

puts "10! is #{Fact.fact(10)}"
