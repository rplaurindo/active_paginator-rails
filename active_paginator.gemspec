$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_paginator/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_paginator-rails"
  s.version     = ActivePaginator::Rails::VERSION
  s.authors     = ["rplaurindo"]
  s.email       = ["rafaelplaurindo@gmail.com"]
  s.homepage    = "https://rubygems.org/gems/active_paginator-rails"
  s.summary     = "Summary of ActivePaginator."
  s.description = "A simple but very useful paginator for ActiveRecord."
  s.license     = "MIT"

  s.files = Dir["{config,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "active_paginator.gemspec"]
  s.require_paths = %w{config lib vendor}
  s.test_files = Dir["test/**/*"]

  # needs to work like "rake"
  ACTIVE_PAGINATOR_RUNTIME_DEPENDENCIES = {
    "rails": "~> 3"
  }

  # needs to run a specific task
  ACTIVE_PAGINATOR_DEPENDENCIES = {
  }

  ACTIVE_PAGINATOR_RUNTIME_DEPENDENCIES.each do |pkg, v|
    s.add_runtime_dependency pkg.to_s, v
  end

  ACTIVE_PAGINATOR_DEPENDENCIES.each do |pkg, v|
    s.add_development_dependency pkg.to_s, v
  end
end
