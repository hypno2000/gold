defmodule Gold.TransactionDetails do
  @moduledoc """
  Struct which holds all transaction details data
  """

  defstruct [:account,
             :address,
             :category,
             :amount,
             :label,
             :vout,
             :fee,
             :abandoned]

  @doc """
  Creates TransactionDetails struct from JSON transaction details object.
  """
  def from_json(details) do
    %Gold.TransactionDetails{
      account:       Map.get(details, "account", nil),
      address:       Map.get(details, "address", nil),
      category:      case Map.get(details, "category", nil) do
                       nil -> nil
                       otherwise -> String.to_atom otherwise
                     end,
      amount:        Gold.btc_to_decimal(Map.fetch!(details, "amount")),
      label:         Map.get(details, "label", nil),
      vout:          Map.get(details, "vout", nil),
      fee:           Gold.btc_to_decimal(Map.get(details, "fee", nil)),
    }
  end

  @doc """
  Returns `true` if argument is a bitcoin transaction details; otherwise `false`.
  """
  def transaction_details?(%Gold.TransactionDetails{}), do: true
  def transaction_details?(_), do: false

end
