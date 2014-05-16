#!/usr/bin/env ruby
#
#   Author: Tom Llewellyn-Smith <tom@onixconsulting.co.uk>
#   Copyright: © Onix Consulting Limited 2012-2014. All rights reserved.
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
require 'optparse'
require 'mole'

$PROGRAM_NAME = File.basename($0)
$PROGRAM_VERSION = '0.1'
options = {}

OptionParser.new do |opts|
    opts.banner = "version: #{$PROGRAM_VERSION}\nusage: #{$PROGRAM_NAME} [options]"
    opts.on("-c CONFIG","--config", "YAML config") do |c|
        options[:config] = c
    end
end.parse!

# We need a config!!!
if options[:config].nil? then
    puts "error: #{$PROGRAM_NAME} requires YAML config, use -h for help"
    exit 1
end

# catch control+c
trap("SIGINT") { exit! }

tbm = Mole.new(options[:config])
tbm.services.each do |srv,detail|
    tbm.bore(detail['local_port'],detail['remote_port'],detail['dst_host'])
end

# wait for all children
tbm.wait
