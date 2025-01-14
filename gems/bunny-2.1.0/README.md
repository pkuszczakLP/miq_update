# Bunny, a Ruby RabbitMQ Client

Bunny is a RabbitMQ client that focuses on ease of use. It
is feature complete, supports all recent RabbitMQ features and does not
have any heavyweight dependencies.


## I Know What RabbitMQ and Bunny are, How Do I Get Started?

[Right here](http://rubybunny.info/articles/getting_started.html)!


## What is Bunny Good For?

One can use Bunny to make Ruby applications interoperate with other
applications (both built in Ruby and not). Complexity and size may vary from
simple work queues to complex multi-stage data processing workflows that involve
many applications built with all kinds of technologies.

Specific examples:

 * Events collectors, metrics & analytics applications can aggregate events produced by various applications
   (Web and not) in the company network.

 * A Web application may route messages to a Java app that works
   with SMS delivery gateways.

 * MMO games can use flexible routing RabbitMQ provides to propagate event notifications to players and locations.

 * Price updates from public markets or other sources can be distributed between interested parties, from trading systems to points of sale in a specific geographic region.

 * Content aggregators may update full-text search and geospatial search indexes
   by delegating actual indexing work to other applications over RabbitMQ.

 * Companies may provide streaming/push APIs to their customers, partners
   or just general public.

 * Continuous integration systems can distribute builds between multiple machines with various hardware and software
   configurations using advanced routing features of RabbitMQ.

 * An application that watches updates from a real-time stream (be it markets data
   or Twitter stream) can propagate updates to interested parties, including
   Web applications that display that information in the real time.



## Supported Ruby Versions

Modern Bunny versions support

 * CRuby 2.2, 2.1, 2.0

Bunny works sufficiently well on JRuby but there are known
JRuby bugs that cause high CPU burn. JRuby users should
use [March Hare](http://rubymarchhare.info).

Bunny `1.7.x` was the last version to support CRuby 1.9.3 and 1.8.7


## Supported RabbitMQ Versions

Bunny `1.5.0` (including previews) and later versions only support RabbitMQ `3.3+`.
Bunny `1.4.x` and earlier supports RabbitMQ 2.x and 3.x.


## Project Maturity

Bunny is a mature library (started in early 2009) with
a stable public API.

Before version 0.9, **a lot** of functionality was missing.  Version
0.9 can be considered to be a "second birthday" for Bunny as it was
rewritten from scratch with over a dozen of preview releases over the
course of about a year.

We (the maintainers) made our best effort to keep the new version as
backwards compatible as possible but within reason.


## Installation & Bundler Dependency

### Most Recent Release

[![Gem Version](https://badge.fury.io/rb/bunny.png)](http://badge.fury.io/rb/bunny)

### With Rubygems

To install Bunny with RubyGems:

```
gem install bunny
```

### Bundler Dependency

To use Bunny in a project managed with Bundler:

``` ruby
gem "bunny", ">= 2.0.1"
```


## Quick Start

Below is a small snippet that demonstrates how to publish
and synchronously consume ("pull API") messages with Bunny.

For a 15 minute tutorial using more practical examples, see [Getting Started with RabbitMQ and Ruby using Bunny](http://rubybunny.info/articles/getting_started.html).

``` ruby
require "bunny"

# Start a communication session with RabbitMQ
conn = Bunny.new
conn.start

# open a channel
ch = conn.create_channel

# declare a queue
q  = ch.queue("test1")

# publish a message to the default exchange which then gets routed to this queue
q.publish("Hello, everybody!")

# fetch a message from the queue
delivery_info, metadata, payload = q.pop

puts "This is the message: #{payload}"

# close the connection
conn.stop
```


## Documentation

### Getting Started

For a 15 minute tutorial using more practical examples, see [Getting Started with RabbitMQ and Ruby using Bunny](http://rubybunny.info/articles/getting_started.html).

### Guides

Other documentation guides are available at [rubybunny.info](http://rubybunny.info):

 * [Queues and Consumers](http://rubybunny.info/articles/queues.html)
 * [Exchanges and Publishers](http://rubybunny.info/articles/exchanges.html)
 * [AMQP 0.9.1 Model Explained](http://www.rabbitmq.com/tutorials/amqp-concepts.html)
 * [Connecting to RabbitMQ](http://rubybunny.info/articles/connecting.html)
 * [Error Handling and Recovery](http://rubybunny.info/articles/error_handling.html)
 * [TLS/SSL Support](http://rubybunny.info/articles/tls.html)
 * [Bindings](http://rubybunny.info/articles/bindings.html)
 * [Using RabbitMQ Extensions with Bunny](http://rubybunny.info/articles/extensions.html)
 * [Durability and Related Matters](http://rubybunny.info/articles/durability.html)

### API Reference

[Bunny API Reference](http://reference.rubybunny.info/).


## Community and Getting Help

### Mailing List

[Bunny has a mailing list](http://groups.google.com/group/ruby-amqp). We encourage you
to also join the [RabbitMQ mailing list](https://groups.google.com/forum/#!forum/rabbitmq-users) mailing list. Feel free to ask any questions that you may have.


### IRC

For more immediate help, please join `#rabbitmq` on `irc.freenode.net`.


### News & Announcements on Twitter

To subscribe for announcements of releases, important changes and so on, please follow [@rubyamqp](https://twitter.com/#!/rubyamqp) on Twitter.

More detailed announcements can be found in the blogs

* [RabbitMQ Ruby clients blog](http://blog.rubyrabbitmq.info)


### Reporting Issues

If you find a bug, poor default, missing feature or find any part of
the API inconvenient, please [file an
issue](http://github.com/ruby-amqp/bunny/issues) on GitHub.  When
filing an issue, please specify which Bunny and RabbitMQ versions you
are using, provide recent RabbitMQ log file contents if possible, and
try to explain what behavior you expected and why. Bonus points for
contributing failing test cases.


### Running the Specs

The specs require RabbitMQ to be running locally with a specific set of vhosts
and users. RabbitMQ can be provisioned and started any that's convenient to you
as long as it has a suitable TLS keys configuration and management plugin enabled.
Make sure you have a recent version of RabbitMQ (> `3.5.3`).

You can also start a clean RabbitMQ server
node on your machine specifically for the bunny specs.
To do so, run the following command
from the base directory of the gem:

```
RABBITMQ_NODENAME=bunny RABBITMQ_CONFIG_FILE=./spec/config/rabbitmq RABBITMQ_ENABLED_PLUGINS_FILE=./spec/config/enabled_plugins rabbitmq-server
```

The specs use the RabbitMQ management plugin and require a TLS port to be available. The config files in the spec/config directory enable these.

Next up you'll need to prepare your node for the specs (just once):

```
RABBITMQ_NODENAME=bunny ./bin/ci/before_build
```

And then run the core integration suite:

```
RABBITMQ_NODENAME=bunny CI=true rspec
```

## Other Ruby RabbitMQ Clients

The other widely used Ruby RabbitMQ client is [March Hare](http://rubymarchhare.info) (JRuby-only).
It's a mature library that require RabbitMQ 3.3.x or later.


## Contributing

First, clone the repository and run

    bundle install --binstubs

then set up RabbitMQ vhosts with

    ./bin/ci/before_build

(if needed, set `RABBITMQCTL` env variable to point to `rabbitmqctl` you want to use)

and then run tests with

    CI=true ./bin/rspec -cf documentation spec

After that create a branch and make your changes on it. Once you are done with your changes and all tests pass, submit a pull request
on GitHub.


## License

Released under the MIT license.
