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
      @nonce = START_NONCE
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
  end
end
