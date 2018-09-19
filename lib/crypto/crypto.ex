defmodule Crypto do
  @hash_fields [:data, :timestamp, :prev_hash]

  @doc """
  Creates a hash for the new block
  """
  def hash(%{} = block) do
    block
    |> Map.take(@hash_fields)
    |> Poison.encode!
    |> sha256
  end

  @doc """
  Writes a newly created hash to the block
  """
  def write_hash(%{} = block) do
    %{ block | hash: hash(block) }
  end

  @doc """
  SHA256 a string
  """
  defp sha256(binary) do
    :crypto.hash(:sha256, binary) |> Base.encode16
  end
end
