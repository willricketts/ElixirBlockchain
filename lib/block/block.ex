defmodule Block do
  defstruct [:data, :timestamp, :prev_hash, :hash]

  @doc """
  Creates a block using the provided data and previous block's hash
  """
  def new(data, prev_hash) do
    %Block{
      data: data,
      prev_hash: prev_hash,
      timestamp: NaiveDateTime.utc_now,
    }
  end

  @doc """
  Creates the first block of the chain. Necessary for the absence of
  a prev_hash
  """
  def genesis do
    %Block{
      data: "GENESIS_DATA",
      prev_hash: "GENESIS_HASH",
      timestamp: NaiveDateTime.utc_now,
    }
  end

  @doc """
  Validates a block's hash
  """
  def valid?(%Block{} = block) do
    Crypto.hash(block) == block.hash
  end

  @doc """
  Validates the relationship between two blocks
  """
  def valid?(%Block{} = block, %Block{} = prev_block) do
    (block.prev_hash == prev_block.hash) && valid?(block)
  end
end
