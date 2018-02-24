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
      blocks.each_cons(2).all? do |a, b|
        a.block_hash == b.previous_hash
      end
    end

    def ==(other)
      return false if other.nil? || !other.is_a?(Blockchain)

      blocks == other.blocks
    end

    def to_s
      blocks.reverse.map(&:to_s).join("\n------\n")
    end

    def to_json
      blocks.map(&:to_json)
    end

    def self.from_json(json_blocks, content_class = nil)
      blocks = json_blocks.map { |b| Block.from_json(b, content_class) }

      blockchain = Blockchain.allocate # creates an instance without calling new/initialize
      blockchain.instance_variable_set(:@blocks, blocks)
      blockchain
    end
  end
end
