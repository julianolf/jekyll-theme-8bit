# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = 'jekyll-theme-8bit'
  spec.version  = '0.7.1'
  spec.authors  = ['Juliano Fernandes']
  spec.email    = ['julianofernandes@gmail.com']
  spec.summary  = 'A Jekyll theme inspired by classic 8bit games.'
  spec.homepage = 'https://github.com/julianolf/jekyll-theme-8bit'
  spec.license  = 'MIT'

  spec.files    = `git ls-files -z`.split("\x0").select do |f|
    f.match(/^(assets|_layouts|_includes|_sass|LICENSE|README)/i)
  end

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.6'
  spec.add_runtime_dependency 'jekyll', '>= 3.8.5', '< 4.5.0'
  spec.add_runtime_dependency 'jekyll-paginate', '~> 1.1.0'
  spec.add_runtime_dependency 'jekyll-seo-tag', '~> 2.8.0'
  spec.add_development_dependency 'kramdown-parser-gfm', '~> 1.1.0'
  spec.add_development_dependency 'webrick', '~> 1.9.0'
  spec.add_development_dependency 'html-proofer', '~> 5.0.7'
  spec.add_development_dependency 'rake', '~> 13.3.0'
  spec.add_development_dependency 'rubocop', '~> 1.55.1'
  spec.add_development_dependency 'w3c_validators', '~> 1.3.7'
end
