# MessagePack-RPC over HTTP (JRuby)

This library provides [MessagePack-RPC](https://github.com/msgpack/msgpack-rpc) via HTTP as XML-RPC.
The original MessagePack-RPC Server in Ruby is not good in some cases.
It doesn't scale. It's incompatible with Thread. There is no decent termination processing...

We alreadly have various high perfomance HTTP servers.
We can use these in MessagePack-RPC over HTTP.

**CAUTION**

There is no compatibility with other implementation of normal MessagePack-RPC (not over HTTP).
So a normal RPC client can not connect a HTTP server.

**PLATFORM NOTIFICATION**

This branch is for JRuby, and protocol is comatible with the original gem (msgpack-rpc-over-http) for CRuby.
Code is 100% same with msgpack-rpc-over-http by authorNari. See: https://github.com/authorNari/msgpack-rpc-over-http

## Usage

**Server**

confir.ru:
```ruby
require 'msgpack-rpc-over-http-jruby'
class MyHandler
  def add(x,y) return x+y end
end

run MessagePack::RPCOverHTTP::Server.app(MyHandler.new)
```

rackup:
```zsh
% rackup config.ru -s mizuno
Mizuno 0.6.6 (Jetty 8.1.3.v20120416) listening on 0.0.0.0:9292
```

**Client**

client.rb:
```ruby
require 'msgpack-rpc-over-http-jruby'
c = MessagePack::RPCOverHTTP::Client.new("http://0.0.0.0:9292/")
result = c.call(:add, 1, 2)  #=> 3
```

## Extended futures

Support streaming response via Chunked Transfer-Encoding.

```ruby
# server side
class Handler
  include MessagePack::RPCOverHTTP::Server::Streamer
  def log
    return stream do
      File.open('/var/log/syslog') do |f|
        while line = f.gets.chomp
          # write a chunked data
          chunk(line)
        end
      end
    end
  end
end

# client
client = MessagePack::RPCOverHTTP::Client.new("http://0.0.0.0:80/")
client.stream do |line|
  p line # => "Nov 3 ..."
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'msgpack-rpc-over-http-jruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install msgpack-rpc-over-http-jruby

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
