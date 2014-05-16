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
class Mole
    require 'mole/commands'
    require 'mole/config'

    attr_accessor :config, :services, :ssh

    def initialize(config)  
        @config_file = config
        @config = Mole::Config.read(@config_file)
        @src_host = Mole::Config.src_host(@config)
        @services = Mole::Config.services(@config)
        @ssh = Mole::Config.ssh(@config)
    end

    def bore(local_port,remote_port,dst_host)
        pid = Mole::Commands.create(@ssh,local_port,remote_port,dst_host,@src_host)
        puts "      host: 127.0.0.1"
        puts "      port: #{local_port}"
        puts "       via: #{@src_host}"
        puts "       pid: #{pid}"
    end

    def wait()
        Process.waitall
    end
end
