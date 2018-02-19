require "blockchain/version"
require "blockchain/block"
require "blockchain/blockchain"

module Blockchain
  def self.create!(*args)
    blockchain = Blockchain.new("-- Genesis Block --")
    args.each { |a| blockchain.add_block(a) }
    blockchain
  end
end
