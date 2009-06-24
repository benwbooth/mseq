require 'rake/gempackagetask'

spec = Gem::Specification.new do |s| 
  s.name       = "mseq"
  s.summary    = "Music Sequencing Language"
  s.description= File.read(File.join(File.dirname(__FILE__), 'README'))
  s.requirements = 
      [ '' ]
  s.version     = "0.0.1"
  s.author      = "Ben Booth"
  s.email       = "benbooth5@gmail.com"
  s.homepage    = "http://github.com/benbooth5/mseq"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.files       = Dir['**/**']
  s.executables = [ 'mseq' ]
  s.test_files  = Dir["test/test*.rb"]
  s.has_rdoc    = false
end
 
Rake::GemPackageTask.new(spec).define

