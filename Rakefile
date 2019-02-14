# frozen_string_literal: true

require 'rake/clean'
require 'html-proofer'
require 'w3c_validators'
require 'rubocop/rake_task'
require 'rubygems'

BUILD_DIR = '_site'

CLEAN.include(BUILD_DIR, '.sass-cache')
CLOBBER.include('jekyll-theme-8bit-*.gem')

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

# Add Rubocop pre-defined tasks.
RuboCop::RakeTask.new

desc 'Build 8bit theme Gem'
task build: %i[clobber] do
  sh 'gem', 'build', 'jekyll-theme-8bit.gemspec'
end

desc 'Build a site using 8bit theme'
task build_site: %i[clean] do
  sh 'jekyll', 'build'
end

desc 'Validate HTML and CSS'
task validate: %i[build_site] do
  # Validate according to W3C standards
  validate(File.join(BUILD_DIR, 'index.html'))
  validate(File.join(BUILD_DIR, 'assets', 'css', 'style.css'))

  # Validate the integrity of the HTML
  options = {
    assume_extension: true,
    check_html: true,
    disable_external: true
  }
  HTMLProofer.check_directory(BUILD_DIR, options).run
end

desc 'Test suite for 8bit theme'
task test: %i[validate rubocop]

desc 'Build and validate 8bit theme'
task default: %i[test build]

desc 'Tag and publish the new gem'
task release: %i[build] do
  # Make sure we're on the master branch
  sh 'git rev-parse --abbrev-ref HEAD | grep -q master' do |ok, out|
    unless ok
      puts 'Only release from the master branch.'
      exit out.exitstatus
    end
  end

  # Figure out what version we're releasing
  version = Gem::Specification.load('jekyll-theme-8bit.gemspec').version

  # Make sure we haven't released this version yeat
  sh 'git fetch -t origin'
  sh "git tag -l | grep -q '#{version}'" do |ok, _|
    if ok
      puts "Whoops, there's already a #{version} tag."
      exit 1
    end
  end

  # Tag and publish it
  sh "gem push jekyll-theme-8bit-#{version}.gem"
  sh "git tag #{version}"
  sh 'git push origin master'
  sh "git push origin #{version}"
end
