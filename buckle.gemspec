$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "buckle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "buckle"
  s.version     = Buckle::VERSION
  s.authors     = ["Peter Cepeda"]
  s.email       = ["pcepeda@pubget.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Buckle."
  s.description = "TODO: Description of Buckle."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "jquery-rails"
  s.add_dependency 'bootstrap-sass', '~> 3.0.2.0'

  s.add_development_dependency 'sass-rails', '>= 3.2'
  s.add_development_dependency 'slim-rails'

  s.add_development_dependency "sqlite3"
end
