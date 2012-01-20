# -*- encoding : utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jquery-iframe_auto_resize/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jquery-iframe_auto_resize"
  s.version     = JqueryIframeAutoResize::VERSION
  s.authors     = ["Patrick Helm"]
  s.email       = ["deradon87@gmail.com", "patrick.helm@werbeboten.de"]
  s.homepage    = "http://www.deckel-gesucht.de"
  s.summary     = "JQuery Plugin to auto-resize iFrames from same domain."
  s.description = "JQuery Plugin to auto-resize iFrames from same domain."

  s.files = Dir["{app,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
  # s.add_dependency "coffee-rails", ">= 3.1.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "haml"
  s.add_development_dependency "jquery-rails"
end

