# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-8bit"
  spec.version       = "0.1.0"
  spec.authors       = ["Juliano Fernandes"]
  spec.email         = ["julianofernandes@gmail.com"]

  spec.summary       = "A Jekyll theme inspired by classic 8bit games."
  spec.homepage      = "https://github.com/julianolf/jekyll-theme-8bit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 3.8"

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "rake", "~> 12.3.2"
end
