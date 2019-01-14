# frozen_string_literal: true

require 'w3c_validators'
require 'rubocop/rake_task'

BUILD_DIR = '_site'

def validator(file)
  extension = File.extname(file)
  if extension == '.html'
    W3CValidators::NuValidator.new
  elsif extension == '.css'
    W3CValidators::CSSValidator.new
  end
end

def validate(file)
  puts "Checking #{file}..."

  path = File.expand_path(file, __dir__)
  results = validator(file).validate_file(path)

  return puts 'Valid!' if results.errors.empty?

  results.errors.each { |err| puts err.to_s }
  exit 1
end

desc 'Build 8bit theme Gem'
task :build do
  sh 'gem', 'build', 'jekyll-theme-8bit.gemspec'
end

desc 'Build the site using 8bit theme'
task :build_site do
  sh 'jekyll', 'build'
end

desc 'Validate HTML according to W3C standards'
task :validate_html do
  validate(File.join(BUILD_DIR, 'index.html'))
  validate(File.join(BUILD_DIR, 'assets', 'css', 'style.css'))
end

desc 'Test suite for HTML output'
task :test_html do
  sh 'htmlproofer', BUILD_DIR, '--check-html',
     '--check-sri', '--disable-external'
end

# Add Rubocop pre-defined tasks.
RuboCop::RakeTask.new

desc 'Build and validate 8bit theme'
task default: %i[build_site validate_html test_html rubocop build]
