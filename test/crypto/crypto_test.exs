defmodule CryptoTest do
  use ExUnit.Case

  describe "write_hash" do
    test "writes a hash to a new block" do
      chain = Blockchain.new
      updated_chain = Blockchain.insert(chain, "some data")
      genesis_block = Enum.at(updated_chain, 1)
      new_block = hd(updated_chain)

      assert new_block.prev_hash == genesis_block.hash
      assert new_block.hash != nil
    end
  end
end
