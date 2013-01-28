# encoding: utf-8
method_with_hash_arg(joel:1, :larsson => 2) #bad
method_with_hash_arg(:joel => 1, :larsson => 2) #bad
bad_hash_with_mixed_syntax = { joel: 1, :larsson => 2}
bad_hash_with_old_syntax = { :joel => 1, :larsson => 2}
bad_nested_hash_with_mixed_syntax = {
  joel: 1,
  larsson: 2,
  nested_hash: {
    :bad_nested_key => 3}}
