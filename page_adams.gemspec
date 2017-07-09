$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "page_adams/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "page_adams"
  s.version     = PageAdams::VERSION
  s.authors     = ["Sebastián González"]
  s.email       = ["sebagonz91@gmail.com"]
  s.homepage    = "https://github.com/sebastialonso/page_adams"
  s.summary     = "Pagination made easy."
  s.description = "Automatically paginate your ActiveRecord models."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8'
  s.add_development_dependency 'faker', '~> 1.7'
end
