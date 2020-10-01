#!/usr/bin/tclsh

lappend auto_path [pwd]
package require dowhile

puts "while"
puts [time {set i 5000; while {[incr i -1]} {}} 100]
puts "do-while"
puts [time {set i 5000; do {} while {[incr i -1]}} 100]

puts "nested loop"
puts "while"
puts [time {set i 100; while {[incr i -1]} {set j 1000; while {[incr j -1]} {}}} 100]
puts "do-while"
puts [time {set i 100; do {set j 1000; do {} while {[incr j -1]}} while {[incr i -1]}} 100]
