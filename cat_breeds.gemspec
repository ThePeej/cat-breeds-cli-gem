
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cat_breeds/version"

Gem::Specification.new do |spec|
  spec.name          = "cat_breeds"
  spec.version       = CatBreeds::VERSION
  spec.authors       = ["PJ Frias"]
  spec.email         = ["peejfrias@gmail.com"]

  spec.summary       = %q{A gem that provides information on the most common cat breeds}
  spec.homepage      = "https://github.com/ThePeej/cat-breeds-cli-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # spec.files         = ["lib/cat-breeds.rb", "lib/cats.rb", "lib/cli.rb", "lib/scraper.rb", "bin/cat-breeds"]

  # spec.bindir        = "bin"
  spec.executables = ['cat-breeds']
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
