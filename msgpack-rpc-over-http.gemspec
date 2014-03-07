# -*- encoding: utf-8 -*-
require File.expand_path('../lib/msgpack/rpc_over_http/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["TAGOMORI Satoshi"]
  gem.email         = ["tagomoris@gmail.com"]
  gem.description   = %q{This library provides MessagePack-RPC via HTTP, jruby fork}
  gem.summary       = %q{This library provides MessagePack-RPC via HTTP, jruby fork}
  gem.homepage      = "https://github.com/authorNari/msgpack-rpc-over-http"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "msgpack-rpc-over-http-jruby"
  gem.require_paths = ["lib"]
  gem.version       = MessagePack::RPCOverHTTP::VERSION

  gem.add_runtime_dependency "rack"
  gem.add_runtime_dependency "msgpack-jruby", "~> 1.3.2"
  gem.add_runtime_dependency "celluloid", "~> 0.12.3"
  gem.add_runtime_dependency "httpclient"

  gem.add_development_dependency "thin"
end
