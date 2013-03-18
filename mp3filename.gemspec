Gem::Specification.new do |s|
  s.name = "mp3filename"
  s.version = "1.0.2"
  s.authors = ["Manoj Mishra"]
  s.date = %q{2012-03-18}
  s.description = 'Mp3 File Name is a utility to rename mp3 files to their title'
  s.summary = s.description
  s.email = 'b0rn2c0d3@gmail.com'
  s.files = ['README', 'lib/mp3filename.rb']
  s.homepage = 'https://github.com/railsfreak/mp3filename'
  s.has_rdoc = false
  s.add_dependency('ruby-mp3info')
  s.bindir = "bin"
  s.executables = ["mp3filename"]
end

