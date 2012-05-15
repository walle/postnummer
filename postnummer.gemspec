lib = File.expand_path('../lib', __FILE__)
$:.unshift lib unless $:.include? lib

require 'postnummer/version'

Gem::Specification.new do |s|
  s.name = 'postnummer'
  s.version = Postnummer::VERSION
  s.authors = 'Fredrik Wallgren'
  s.email = 'fredrik.wallgren@gmail.com'
  s.homepage = 'https://github.com/walle/postnummer'
  s.summary = 'Library for looking up swedish zip_codes using posten.se'
  s.description = 'Library for looking up swedish zip_codes using posten.se. Capable of finding all streets that have a certain zip_code.'

  s.rubyforge_project = s.name

  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w[README.textile LICENSE]

  s.add_dependency 'mechanize', '~> 2.5.1'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'

  s.files = Dir.glob('lib/**/*') + ['LICENSE', 'README.textile']
end


