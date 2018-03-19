use Mix.Config

config :gold, :regtest, [
  hostname: "localhost",
  port: 18332,
  user: "bitcoinrpc",
  password: "bitcoinrpc"
]

config :logger, level: :warn
