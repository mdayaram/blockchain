require "blockchain/version"
require "blockchain/block"
require "blockchain/blockchain"

module Blockchain
  def self.create!(*args)
    Blockchain.new(*args)
  end
end
