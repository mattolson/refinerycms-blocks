# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-blocks'
  s.version           = '0.1'
  s.summary           = 'Blocks extension for Refinery CMS'
  s.description       = 'Ruby on Rails Blocks extension for Refinery CMS'
  s.authors           = ['Matt Olson']
  s.email             = 'matt@mattolson.com'
  s.homepage          = 'https://github.com/mattolson/refinerycms-blocks'
  s.license           = 'MIT'
  s.date              = Time.now.strftime("%Y-%m-%d")
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.0.dev'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0.dev'
end
