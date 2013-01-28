# encoding: utf-8
good_hash_with_string_keys  = { "joel" => 1, "larsson" => 2}
good_hash_with_new_syntax   = { joel: 1,  larsson: 2 }
good_hash_with_mixed_syntax = { joel: 1, "larsson" => 2}
good_nested_hash_with_new_syntax = {
  joel: 1,
  larsson: 2,
  nested_hash: { good_nested_key: 3}
}
good_empty_hash = {}
method_with_hash_arg(joel:1, larsson:2) #good
method_with_hash_arg(joel:1, "larsson" => 2) #good
method_with_hash_arg({}) #good
