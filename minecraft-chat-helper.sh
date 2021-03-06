#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2014 Star Brilliant <m13253@hotmail.com>
# Copyright (c) 2016 Lion Yang <lion@aosc.xyz>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e
which zenity &>/dev/null || (echo 'ERROR: cannot find "zenity"' >&2; exit 2)
which xdotool &>/dev/null || (echo 'ERROR: cannot find "xdotool"' >&2; zenity --error --text 'ERROR: cannot find "xdotool"' --title 'Minecraft Chat Helper'; exit 2)
_id="$(xdotool search --class "minecraft ")"
test -z "$_id" && exit 0
_mcchat_input="$(zenity --entry --text 'Type what you want to type here:' --title 'Minecraft Chat Helper')"
xdotool windowfocus --sync "$_id"
test -z "$_mcchat_input" && exit 0
sleep 0.15
xdotool type --window "$_id" --delay 150 "$_mcchat_input"
