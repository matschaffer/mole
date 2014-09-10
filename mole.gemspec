Gem::Specification.new do |s|
  s.name        = 'mole'
  s.version     = '0.0.1'
  s.date        = '2014-05-20'
  s.summary     = "Creates SSH Tunnels"
  s.description = "Creates SSH Tunnels from a YAML file"
  s.authors     = ["Tom Llewellyn-Smith"]
  s.email       = 'code@onixconsulting.co.uk'
  s.files       = [
    'bin/demo.yaml',
    'lib/mole/commands.rb',
    'lib/mole/config.rb',
    'lib/mole.rb',
    'LICENSE',
    'README.md'
  ]
  s.executables << 'tbm.rb'
  s.homepage    = 'https://github.com/brahman81/mole'
  s.license       = 'GPLv3'
end
