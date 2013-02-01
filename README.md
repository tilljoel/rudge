# Rudge

### Current status
This document

### Plan
Build a tool that check Ruby coding conventions

Using Ruby Ripper like this:

```
1.9.3 (main):0 > p Ripper.lex("a = 1+1")
```
```ruby
[[[1, 0], :on_ident, "a"],
 [[1, 1], :on_sp,    " "],
 [[1, 2], :on_op,    "="],
 [[1, 3], :on_sp,    " "],
 [[1, 4], :on_int,   "1"],
 [[1, 5], :on_op,    "+"],
 [[1, 6], :on_int,   "1"]]
```

```
1.9.3 (main):0 > p Ripper.lex("a = 1+1")
```
```ruby
[:program,
 [[:assign,
  [:var_field,
   [:@ident,
   "a",
   [1, 0]]],
  [:binary,
   [:@int, "1", [1, 4]],
   :+,
   [:@int, "1", [1, 6]]]]]]
```

### Why
Learn more about Ruby Ripper, lex-tokens and s-expressions. And of course
cleanup my code :)

### Ideas

* Integrate in CI, commit hooks or editor
* Write nice wrapper around s-exp arrays

## Rules
* Space around some operators, no space around some
* Space after comma
* Prefer single-quoted strings when you don't need string interpolation
* Use empty lines between defs.
* Use two lines before class?
* Use no newlines after "end"
* Indent when as deep as case.

## Warnings
* "Sandi Metz rules"
* Law of demeter
* To much nesting
* Rescue without exception
* Find unused methods


##

## Contributing to Rudge

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## For developers

Not ready yet.

## Copyright

Copyright (c) 2012 Joel Larsson. See LICENSE.txt for
further details.
