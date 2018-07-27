defmodule Blockchain do
  @doc """
  Creates a new chain with genesis block
  """
  def new do
    [ Crypto.write_hash(Block.genesis) ]
  end

  @doc """
  Creates a new block on the end of the chain containing the provided
  data and a prev_hash corresponding to the previous block
  """
  def insert(blockchain, data) when is_list(blockchain) do
    %Block{hash: prev} = hd(blockchain)

    block =
      data
      |> Block.new(prev)
      |> Crypto.write_hash

    [ block | blockchain ]
  end

  @doc """
  Verifies integrity of chain by walking back the block history
  """
  def valid?(blockchain) when is_list(blockchain) do
    genesis = Enum.reduce_while(blockchain, nil, fn prev, current ->
      cond do
        current == nil ->
          {:cont, prev}

        Block.valid?(current, prev) ->
          {:cont, prev}

        true ->
          {:halt, false}
      end
    end)

    if genesis, do: Block.valid?(genesis), else: false
  end
end
