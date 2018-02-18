module Blockchain
  class Blockchain
    attr_reader :blocks

    def initialize(*args)
      @blocks = [genesis_block]
      args.each do |a|
        add_block(a)
      end
    end

    def add_block(content)
      blocks << Block.new(content: content, previous_hash: blocks.last.block_hash)
    end

    private

    def genesis_block
      Block.new(content: "And so it begins", previous_hash: nil)
    end
  end
end
