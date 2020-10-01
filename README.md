Overview
========
dowhile package implement a do-while loop.
See Warning section at bottom!

Syntax
======

```
do {
	HERE
	LOOP
	BODY
} while {CONDITION}
```

Description
===========
A loop body can contains break, continue, return and error calls.
A loop condition can be any expression for expr command.
do command always returns empty string.

Example
=======

```
set i 5
do {
	puts $i
} while {[incr i -1]}
```

Warning!
========
This do-while is ~4.0 times slower than tcl while. Even naive C version of
this do-while(without coroutine support) is 3.5 times slower than tcl while.
So, the simple way is to use this replacement of do-while in a code:
```
while 1 {
	BODY
	if {!COND} break
}
```
