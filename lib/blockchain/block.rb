require 'digest'

module Blockchain
  class Block
    attr_reader :content
    attr_reader :previous_hash
    attr_reader :nonce

    START_NONCE = "Crying Breakfast Friends"
    WORK_FACTOR = 4

    def initialize(content:, previous_hash:)
      @content = content
      @previous_hash = previous_hash
      @nonce = START_NONCE.dup
      mine!
    end

    def block_hash
      Digest::SHA2.hexdigest([previous_hash, nonce, content].map(&:to_s).join)
    end

    def mine!
      while !block_hash.start_with?("0" * WORK_FACTOR)
        nonce.next!
      end
    end

    def ==(other)
      return false if other.nil? || !other.is_a?(Block)

      content == other.content &&
        previous_hash == other.previous_hash &&
        nonce == other.nonce
    end

    def to_json
      {
        previous_hash: previous_hash,
        nonce: nonce,
        content: content.respond_to?(:to_json) ? content.to_json : content.to_s
      }
    end

    def self.from_json(b, content_class = nil)
      block = Block.allocate # creates an instance without calling new/initialize
      block.instance_variable_set(:@previous_hash, b[:previous_hash])
      block.instance_variable_set(:@nonce, b[:nonce])

      if content_class && content_class.respond_to?(:from_json)
        block.instance_variable_set(:@content, content_class.from_json(b[:content]))
      elsif content_class
        block.instance_variable_set(:@content, content_class.new(b[:content]))
      else
        block.instance_variable_set(:@content, b[:content].to_s)
      end

      block
    end
  end
end
