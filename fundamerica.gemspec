Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=

  s.name    = 'fund_america_crowd'
  s.version = '0.0.1'

  s.summary     = 'Library for accessing the FundAmerica REST API'
  # TODO: s.description

  s.authors  = ['Sajil Koroth']
  s.email    = 'sajil.koroth@gmail.com'
  s.homepage = 'https://github.com/sajilkoroth/fund_america_crowd'

  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end