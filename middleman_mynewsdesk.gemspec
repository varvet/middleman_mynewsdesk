
$:.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = "middleman_mynewsdesk"
  s.version     = "0.0.6"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Johan Halse"]
  s.email       = ["johan.halse@varvet.com"]
  s.homepage    = "https://www.varvet.se"
  s.summary     = %q(An integration with Mynewsdesk for fetching data)
  s.description = %q(Supply this extension with an API key and it will do your dirty work)
  s.licenses      = ["MIT"]

  s.files         = %x(git ls-files).split("\n")
  s.test_files    = %x(git ls-files -- {test,spec,features}/*).split("\n")
  s.executables   = %x(git ls-files -- bin/*).split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", ["~> 4.2"])

  # Additional dependencies
  s.add_runtime_dependency("http", "~> 3.3")
  s.add_runtime_dependency("recursive-open-struct", "~> 1.1")
end
