# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = 'jekyll-theme-8bit'
  spec.version  = '0.3.0'
  spec.authors  = ['Juliano Fernandes']
  spec.email    = ['julianofernandes@gmail.com']
  spec.summary  = 'A Jekyll theme inspired by classic 8bit games.'
  spec.homepage = 'https://github.com/julianolf/jekyll-theme-8bit'
  spec.license  = 'MIT'

  spec.files    = `git ls-files -z`.split("\x0").select do |f|
    f.match(/^(assets|_layouts|_includes|_sass|LICENSE|README)/i)
  end

  spec.platform = Gem::Platform::RUBY
  spec.add_runtime_dependency 'jekyll', '>= 3.8.5', '< 4.1.0'
  spec.add_runtime_dependency 'jekyll-paginate', '~> 1.1.0'
  spec.add_runtime_dependency 'jekyll-seo-tag', '~> 2.5'
  spec.add_development_dependency 'bundler', '~> 2.1.0'
  spec.add_development_dependency 'html-proofer', '~> 3.10'
  spec.add_development_dependency 'rake', '~> 13.0.0'
  spec.add_development_dependency 'rubocop', '~> 0.62'
  spec.add_development_dependency 'w3c_validators', '~> 1.3.4'
end
