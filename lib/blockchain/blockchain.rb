module Blockchain
  class Blockchain
    attr_reader :blocks

    def initialize(genesis_value)
      @blocks = [Block.new(content: genesis_value, previous_hash: nil)]
    end

    def add_block(content)
      blocks << Block.new(content: content, previous_hash: blocks.last.block_hash)
    end

    def valid?
      @blocks.each_cons(2).all? do |a, b|
        a.block_hash == b.previous_hash
      end
    end
  end
end
