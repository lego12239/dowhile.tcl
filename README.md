Overview
========
dowhile package implement a do-while loop.

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

Thanks
======
Thanks for the speed up idea and explanations to Peter Da Silva, Reinhard Max,
Sergey G. Brester and others members of tcl-core mailing list.
