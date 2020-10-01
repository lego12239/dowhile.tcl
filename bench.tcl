#!/usr/bin/tclsh

lappend auto_path [pwd]
package require dowhile

puts "while"
puts [time {set i 5000; while {[incr i -1]} {}} 100]
puts "do-while"
puts [time {set i 5000; do {} while {[incr i -1]}} 100]
