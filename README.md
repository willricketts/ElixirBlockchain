# Simple Elixir Blockchain [![Build Status](https://travis-ci.org/willricketts/ElixirBlockchain.svg?branch=master)](https://travis-ci.org/willricketts/ElixirBlockchain)

## Installation

Install dependencies:

```
mix deps.get
```

## Usage

```
iex(1)> blockchain = Blockchain.new
[
  %Block{
    data: "GENESIS_DATA",
    hash: "CE951B24B03699F1B5E6A44DAE802052A1826BED93D5E47E05D4F5BA957C6C13",
    prev_hash: "GENESIS_HASH",
    timestamp: ~N[2018-07-27 19:13:28.848426]
  }
]
iex(2)> blockchain = Blockchain.insert(blockchain, "First message!")
[
  %Block{
    data: "First message!",
    hash: "B45085E998945659EB2D752026978EC5B535DFD52147DE7096C76A6E7CC36527",
    prev_hash: "CE951B24B03699F1B5E6A44DAE802052A1826BED93D5E47E05D4F5BA957C6C13",
    timestamp: ~N[2018-07-27 19:14:08.155255]
  },
  %Block{
    data: "GENESIS_DATA",
    hash: "CE951B24B03699F1B5E6A44DAE802052A1826BED93D5E47E05D4F5BA957C6C13",
    prev_hash: "GENESIS_HASH",
    timestamp: ~N[2018-07-27 19:13:28.848426]
  }
]
iex(3)> blockchain = Blockchain.insert(blockchain, "Second message!")
[
  %Block{
    data: "Second message!",
    hash: "4A03E92F9D1409E13149804E20A955A937705798B1EEAA7F0AAFFF87CACAE6D4",
    prev_hash: "B45085E998945659EB2D752026978EC5B535DFD52147DE7096C76A6E7CC36527",
    timestamp: ~N[2018-07-27 19:14:25.437820]
  },
  %Block{
    data: "First message!",
    hash: "B45085E998945659EB2D752026978EC5B535DFD52147DE7096C76A6E7CC36527",
    prev_hash: "CE951B24B03699F1B5E6A44DAE802052A1826BED93D5E47E05D4F5BA957C6C13",
    timestamp: ~N[2018-07-27 19:14:08.155255]
  },
  %Block{
    data: "GENESIS_DATA",
    hash: "CE951B24B03699F1B5E6A44DAE802052A1826BED93D5E47E05D4F5BA957C6C13",
    prev_hash: "GENESIS_HASH",
    timestamp: ~N[2018-07-27 19:13:28.848426]
  }
]
iex(4)> Block.valid?(hd(blockchain))
true
iex(5)> Blockchain.valid?(blockchain)
true
```

## Running Tests

```
mix test
```
