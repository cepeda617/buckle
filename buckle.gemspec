$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "buckle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "buckle"
  s.version     = Buckle::VERSION
  s.authors     = ["Peter Cepeda"]
  s.email       = ["pcepeda@pubget.com"]
  s.homepage    = ""
  s.summary     = "Summary of Buckle."
  s.description = "Description of Buckle."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'coderay'
  s.add_dependency 'slim-rails'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'sass-rails', '~> 4.0.1'
  s.add_development_dependency 'sqlite3'
end
