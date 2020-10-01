# Copyright (c) 2020 Oleg Nemanov <lego12239@yandex.ru>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

package provide dowhile 1.0

proc do {body keyword expression} {
	if {$keyword ne "while"} {
		return -code error "wrong keyword \"$keyword\": must be \"while\""
	}
	switch [set code [catch {uplevel 1 $body} ret]] {
		1 -
		2 {
			# error, return
			return -code $code $ret
		}
		3 {
			# break
			return
		}
	}
	# The semicolon before closing double quote is doing all magic with
	# speed up.
	switch [set code [catch {uplevel 1 "[list while $expression $body];"} ret]] {
		1 -
		2 {
			# error, return
			return -code $code $ret
		}
	}
	return
}
