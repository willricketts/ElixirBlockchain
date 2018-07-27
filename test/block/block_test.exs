defmodule BlockTest do
  use ExUnit.Case
  
  describe "new" do
    test "a newly returned block contains all relevant fields" do
      genesis = Blockchain.new |> hd
      new_block = Block.new("some data", genesis.hash)
      
      IO.inspect new_block
      assert Block.valid?(new_block) == false
      assert new_block.hash == nil
      assert new_block.prev_hash != nil
      
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
