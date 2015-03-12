file "libfact.so" => "fact.rs" do
  `rustc --crate-type=dylib fact.rs`
end

task :run => "libfact.so" do
  puts `ruby test.rb`
end
