# Blockchain

In this assignment, you'll be building a blockchain from scratch. You'll want to build a block class, and then a blockchain class that includes all blocks.

* Block
  - `content` (string)
  - `previous_hash` (string)
  - `nonce` (string/number)

* Blockchain
  - `blocks` (array)

I should be able to initialize your blockchain as `Blockchain.new("this is a string".split(" "))` and have it automatically create blocks, compute proof of work for each block, and chain them all together in a blockchain. You should also be able to append new blocks to this blockchain.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blockchain'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blockchain

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mdayaram/blockchain.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
