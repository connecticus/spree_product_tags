# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_product_tags/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_tags'
  s.version     = SpreeProductTags.version
  s.summary     = 'Add support for Product tags that were removed in Spree 4.0'
  s.required_ruby_version = '>= 2.5'

  s.author    = 'Jimmy Stenke'
  s.email     = 'jimmy@stenke.org'
  s.homepage  = 'https://github.com/kejiro/spree_product_tags'
  s.license = 'BSD-3-Clause'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 4.2.0', '< 6.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_api', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'
  s.add_dependency 'acts-as-taggable-on'

  s.add_development_dependency 'spree_dev_tools'
end
