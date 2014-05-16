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
module Mole::Config
    require 'yaml'

    def self.read(file)
        # test config actually exists
        if (File.exists?(file)) then
            @config = YAML.load_file(file)
        end
        return @config
    end

    def self.src_host(config)
        config['src_host']
    end

    def self.services(config)
        config['services']
    end

    def self.ssh(config)
        config['ssh']
    end
end
