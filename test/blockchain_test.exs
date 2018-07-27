defmodule BlockchainTest do
  use ExUnit.Case

  describe "new" do
    test "creates a chain genesis" do
      chain = Blockchain.new
      genesis_block = hd(chain)

      assert genesis_block.hash != nil
    end
  end

  describe "insert" do
    test "adds a new valid block to the chain" do
      chain = Blockchain.new
      updated_chain = Blockchain.insert(chain, "some data")

      assert Block.valid?(hd(updated_chain)) == true
      assert Blockchain.valid?(updated_chain) == true
    end
  end

  describe "valid" do
    test "returns true when the chain is valid" do
      chain = Blockchain.new
      updated_chain = Blockchain.insert(chain, "some data")

      assert Blockchain.valid?(updated_chain) == true
    end

    test "returns false when the chain is invalid" do
      chain = Blockchain.new
      invalid_chain = [hd(chain), Block.new("some data", "invalid hash")]

      assert Blockchain.valid?(invalid_chain) == false
    end
  end
end
