defmodule BlockTest do
  use ExUnit.Case
  
  describe "new" do
    test "a newly returned block contains all relevant fields" do
      genesis = Block.genesis
      new_block = Block.new("some data", genesis.hash)
      
      assert new_block.data != nil
      # Not yet implemented
      # assert new_block.hash != nil
      # assert new_block.prev_hash == genesis.hash
    end
  end

  describe "genesis" do
    test "a genesis block contains the appropriate data" do
      genesis = Block.genesis

      assert genesis.data == "GENESIS_DATA"
      assert genesis.prev_hash == "GENESIS_HASH"
    end
  end
end
