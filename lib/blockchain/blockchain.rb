module Blockchain
  class Blockchain
    attr_reader :blocks

    def initialize(genesis_value)
      @blocks = [Block.new(content: genesis_value, previous_hash: nil)]
    end

    def add_block(content)
      blocks << Block.new(content: content, previous_hash: blocks.last.block_hash)
    end
  end
end
